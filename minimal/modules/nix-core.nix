
{ pkgs, ... }:

{
  # enable flakes globally
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
}
