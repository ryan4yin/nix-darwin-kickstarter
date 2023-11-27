{
  description = "Nix for macOS configuration";

  ##################################################################################################################
  # 
  # Want to know Nix in details? Looking for a beginner-friendly tutorial?
  # Check out https://github.com/ryan4yin/nixos-and-flakes-book !
  # 
  ##################################################################################################################

  # the nixConfig here only affects the flake itself, not the system configuration!
  nixConfig = {
    substituters = [
      # Query the mirror of USTC first, and then the official cache.
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];
  };

  # This is the standard format for flake.nix. `inputs` are the dependencies of the flake,
  # Each item in `inputs` will be passed as a parameter to the `outputs` function after being pulled and built.
  inputs = {
    # nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-23.11-darwin";

    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/master";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs dependencies.
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
  };

  # The `outputs` function will return all the build results of the flake. 
  # A flake can have many use cases and different types of outputs,
  # parameters in `outputs` are defined in `inputs` and can be referenced by their names. 
  # However, `self` is an exception, this special parameter points to the `outputs` itself (self-reference)
  # The `@` syntax here is used to alias the attribute set of the inputs's parameter, making it convenient to use inside the function.
  outputs = inputs@{ self, nixpkgs, darwin, home-manager, ... }:{
    # TODO please update the whole "hostname" placeholder string to your own hostname!
    # such as darwinConfigurations.mymac = darwin.lib.darwinSystem {
    darwinConfigurations."hostname" = darwin.lib.darwinSystem {
      system = "x86_64-darwin";  # change this to "aarch64-darwin" if you are using Apple Silicon
      modules = [
        ./modules/nix-core.nix
        ./modules/system.nix
        ./modules/apps.nix

        ./modules/host-users.nix

        # home manager
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.extraSpecialArgs = inputs;

          # TODO replace "yourusername" with your own username!
          home-manager.users.yourusername = import ./home;
        }
      ];
    };

    # nix codee formmater
    formatter.x86_64-darwin = nixpkgs.legacyPackages.x86_64-darwin.alejandra;
  };
}
