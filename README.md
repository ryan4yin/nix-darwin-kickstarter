# Nix Darwin Kickstarter

An easy-to-understand nix-darwin + home-manager + flakes startup configuration for beginners.

The main purpose of this repository is to help beginners understand the basic configuration of nix-darwin, and to help them quickly start their own nix-darwin configuration.


Two versions of the template are provided here:

- [minimal](./minimal): A minimal configuration that only contains the necessary configuration to start using nix-darwin, and can be safely deployed to your own system.
- [rich-demo](./rich-demo): A rich demo that contains a lot of configuration that can be used as a reference for your own configuration, but it may **OVERWRITE** your system configuration, so **DO NOT** deploy it to your own system directly.


## Why nix-darwin

With nix-darwin, you can manage your macOS system configuration & dotfiles in a declarative way, and you can easily rollback to any previous configuration.
It's also easy to share your configuration with others, and you can easily manage multiple macOS hosts.

