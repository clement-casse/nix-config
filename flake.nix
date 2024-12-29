{
  description = "Nix Flake for defining the setup of my devices";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "utils";
    };
  };

  outputs = inputs@{ self, nixpkgs, utils, nix-darwin, home-manager, nix-vscode-extensions }:
    let
      username = builtins.getEnv "USER";
      fullname = "Clément Cassé";
      email = "clement.casse@proton.me";

      specialArgs = {
        inherit inputs username fullname email nix-vscode-extensions;
      };
    in
    {
      darwinConfigurations = {
        # $ nix run nix-darwin -- switch --flake ".#PowerBook" --impure
        "PowerBook" = nix-darwin.lib.darwinSystem {
          specialArgs = specialArgs // { system = "aarch64-darwin"; };
          modules = [
            ./darwin/PowerBook.nix
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.verbose = true;
              home-manager.extraSpecialArgs = specialArgs // { system = "aarch64-darwin"; };
              home-manager.users."${username}" = ./home;
            }
          ];
        };

        # $ nix run nix-darwin -- switch --flake ".#Workstation" --impure
        "Workstation" = nix-darwin.lib.darwinSystem {
          specialArgs = specialArgs // { system = "aarch64-darwin"; };
          modules = [
            ./darwin/Workstation.nix
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.verbose = true;
              home-manager.extraSpecialArgs = specialArgs // { system = "aarch64-darwin"; };
              home-manager.users."${username}" = ./home;
            }
          ];
        };
      };
    }
    // utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        formatter = pkgs.nixpkgs-fmt;
      }
    );
}
