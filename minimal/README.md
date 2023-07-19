# Nix Darwin Kickstart - Minimal

A minimal configuration that only contains the necessary configuration to start using nix-darwin, and can be safely deployed to your own system.

## How to Start

1. Install [Nix](https://nixos.org/download.html#nix-install-macos)
2. Read all the files in this `minimal` folder, and understand what they do.
   1. If you have trouble understanding, [ryan4yin/nixos-and-flakes-book](https://github.com/ryan4yin/nixos-and-flakes-book) is a good resource to learn nix and flakes.
3. Search `TODO` in this repository, and complete the configuration.
4. Run the following command to start your nix-darwin journey(please change `hostname` to your hostname):
   ```bash
	nix build .#darwinConfigurations.hostname.system \
		--extra-experimental-features 'nix-command flakes'

	./result/sw/bin/darwin-rebuild switch --flake .#hostname
   ```

