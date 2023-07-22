# Nix Darwin Kickstarter - Rich Demo

A rich demo that contains a lot of configuration that can be used as a reference for your own configuration, but it may **OVERWRITE** your system configuration, 
so **DO NOT** deploy it to your own system directly.


## How to Start

1. Start your nix-darwin journey by following the [minimal](../minimal) configuration.
2. Read all the files in this repository, and understand what they do.
   1. If you have trouble understanding, [ryan4yin/nixos-and-flakes-book](https://github.com/ryan4yin/nixos-and-flakes-book) is a good resource to learn nix and flakes.
3. Copy and CUSTOMIZE the configuration you need from this demo to your own configuration.


## Notes on Network Proxy

If you are in a network environment that requires proxy(such as China), you may need to set up proxy for nix and homebrew.

Please refer to the `rich-demo` folder for more details:

- [rich-demo/scripts/darwin_set_proxy.py](https://github.com/ryan4yin/nix-darwin-kickstarter/blob/main/rich-demo/scripts/darwin_set_proxy.py)
- [rich-demo/Makefile](https://github.com/ryan4yin/nix-darwin-kickstarter/blob/main/rich-demo/Makefile)
- [rich-demo - homebrew's mirror settings](https://github.com/ryan4yin/nix-darwin-kickstarter/blob/main/rich-demo/modules/apps.nix#L26-L34)

