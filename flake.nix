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
    };
    nix-vscode-extensions-frozen = {
      url = "github:nix-community/nix-vscode-extensions/f662f854e901ca849f1833cc438c53653cdf94a3";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, utils, nix-darwin, home-manager, ... }:
    let
      username = "clement";
      fullname = "Clément Cassé";
      email = "clement.casse@proton.me";

      specialArgs = {
        inherit inputs username fullname email;
      };
    in
    {
      nixosModules = {

      };

      homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
        # nix run home-manager -- build --flake . --impure
        pkgs = import nixpkgs {
          system = builtins.currentSystem;
          config.allowUnfree = true;
        };
        extraSpecialArgs = specialArgs // { system = builtins.currentSystem; };
        modules = [
          ./home
        ];
      };

      darwinConfigurations = {
        # $ sudo darwin-rebuild switch --flake ".#PowerBook"
        "PowerBook" = nix-darwin.lib.darwinSystem {
          specialArgs = specialArgs // { system = "aarch64-darwin"; };
          modules = [
            ./common
            ./darwin/PowerBook.nix
            (_: { ids.gids.nixbld = 30000; }) # Remove this on the next clean install
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.verbose = true;
              home-manager.backupFileExtension = "backup";
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

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            nil
          ];
        };
      }
    );
}
