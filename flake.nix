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
    mac-app-util = {
      url = "github:hraban/mac-app-util";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "utils";
    };
  };

  outputs = inputs@{ self, nixpkgs, utils, nix-darwin, home-manager, nix-vscode-extensions, mac-app-util }:
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
            ./common
            ./darwin/PowerBook.nix
            (_: { ids.gids.nixbld = 30000; }) # Remove this on the next clean install
            mac-app-util.darwinModules.default
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.verbose = true;
              home-manager.extraSpecialArgs = specialArgs // { system = "aarch64-darwin"; };
              home-manager.sharedModules = [ mac-app-util.homeManagerModules.default ];
              home-manager.users."${username}" = ./home;
            }
          ];
        };

        # $ nix run nix-darwin -- switch --flake ".#Workstation" --impure
        "Workstation" = nix-darwin.lib.darwinSystem {
          specialArgs = specialArgs // { system = "aarch64-darwin"; };
          modules = [
            ./common
            ./darwin/Workstation.nix
            mac-app-util.darwinModules.default
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.verbose = true;
              home-manager.extraSpecialArgs = specialArgs // { system = "aarch64-darwin"; };
              home-manager.sharedModules = [ mac-app-util.homeManagerModules.default ];
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
