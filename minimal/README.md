# Nix Darwin Kickstart - Minimal

## How to Start

1. Install [Nix](https://nixos.org/download.html)
2. Read all the files in this repository, and understand what they do.
3. Search `TODO` in this repository, and complete the configuration.
4. Run the following command to start your nix-darwin journey(please change `hostname` to your hostname):
   ```bash
	nix build .#darwinConfigurations.hostname.system \
		--extra-experimental-features 'nix-command flakes'

	./result/sw/bin/darwin-rebuild switch --flake .#hostname
   ```

