"""
  Set proxy for the Nix daemon to speed up downloads.
  You can safely ignore this file if you don't need a proxy.

  The upstream Nix installer and Determinate Nix use different launchd services:

    upstream:    org.nixos.nix-daemon           /Library/LaunchDaemons/org.nixos.nix-daemon.plist
    Determinate: systems.determinate.nix-daemon /Library/LaunchDaemons/systems.determinate.nix-daemon.plist

  This script patches whichever one is installed.

  https://github.com/NixOS/nix/issues/1472#issuecomment-1532955973
"""
import plistlib
import subprocess
import sys
from pathlib import Path

# launchd service label -> its plist. Determinate Nix replaces the upstream
# nix-daemon with its own `determinate-nixd` service.
NIX_DAEMONS = [
    (
        "systems.determinate.nix-daemon",
        Path("/Library/LaunchDaemons/systems.determinate.nix-daemon.plist"),
    ),
    (
        "org.nixos.nix-daemon",
        Path("/Library/LaunchDaemons/org.nixos.nix-daemon.plist"),
    ),
]

# http proxy provided by clash or other proxy tools
HTTP_PROXY = "http://127.0.0.1:7890"

label, plist = next(((l, p) for l, p in NIX_DAEMONS if p.exists()), (None, None))
if plist is None:
    sys.exit(
        "error: no Nix daemon plist found. Looked for:\n  "
        + "\n  ".join(str(p) for _, p in NIX_DAEMONS)
    )
print(f"configuring proxy for {label}\n  {plist}")

pl = plistlib.loads(plist.read_bytes())
environment = pl.setdefault("EnvironmentVariables", {})
# curl only accepts the lowercase of `http_proxy`!
# https://curl.se/libcurl/c/libcurl-env.html
environment["http_proxy"] = HTTP_PROXY
environment["https_proxy"] = HTTP_PROXY

# remove http proxy
# environment.pop("http_proxy", None)
# environment.pop("https_proxy", None)

# the plist is read-only by default, flip the mode while we rewrite it
plist.chmod(0o644)
plist.write_bytes(plistlib.dumps(pl))
plist.chmod(0o444)

# reload the launchd job so the daemon picks up the new environment. A plain
# restart (kickstart) would reuse the cached job, so boot it out first.
for cmd in (
    f"launchctl bootout system/{label}",
    f"launchctl bootstrap system {plist}",
):
    print(cmd)
    subprocess.run(cmd.split(), check=False)
