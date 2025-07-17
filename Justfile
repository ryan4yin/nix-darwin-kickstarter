# List all the just commands
default:
    @just --list


test-minimal:
  sed -i 's/__USERNAME__/test/g' minimal/flake.nix
  sed -i 's/__SYSTEM__/aarch64-darwin/g' minimal/flake.nix
  sed -i 's/__HOSTNAME__/test/g' minimal/flake.nix
  nix build ./minimal#darwinConfigurations.test.config.system.build.toplevel
  git checkout minimal/flake.nix

test-rich:
  sed -i 's/__USERNAME__/test/g' rich-demo/flake.nix
  sed -i 's/__SYSTEM__/aarch64-darwin/g' rich-demo/flake.nix
  sed -i 's/__HOSTNAME__/test/g' rich-demo/flake.nix
  nix build ./rich-demo#darwinConfigurations.test.config.system.build.toplevel
  git checkout rich-demo/flake.nix
