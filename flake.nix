{
  description = "Nix Flake for defining the setup of my devices";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager }:
    let
      username = builtins.getEnv "USER";

      specialArgs = { inherit inputs username; };
    in
    {
      darwinConfigurations = {
        # $ nix run nix-darwin -- switch --flake ".#PowerBook-M2" --impure
        "PowerBook-M2" = nix-darwin.lib.darwinSystem {
          specialArgs = specialArgs;
          modules = [
            ./darwin/common.nix
            ./darwin/nix.nix
            ./darwin/fonts.nix
            ./darwin/macos.nix
            ./darwin/users.nix
            ./darwin/apps.nix
            home-manager.darwinModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.verbose = true;
              home-manager.backupFileExtension = "before-nix-darwin";
              home-manager.extraSpecialArgs = specialArgs;
              home-manager.users."${username}" = ./home/common.nix;
            }
          ];
        };
      };
    };
}
