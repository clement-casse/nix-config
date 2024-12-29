{ inputs, system, ... }: {
  system.configurationRevision = inputs.rev or inputs.dirtyRev or null;
  system.stateVersion = 5;
  nixpkgs.hostPlatform = system;
  nixpkgs.config.allowUnfree = true;

  environment.etc.darwin.source = inputs.nix-darwin;
  environment.pathsToLink = [ "/Applications" ];

  # Add ability to use TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;

  imports = [
    ./modules/nix.nix
    ./modules/shells.nix
    ./modules/fonts.nix
    ./modules/users.nix

    ./modules/apps/packages.nix
    ./modules/apps/homebrew.nix
    ./modules/apps/appstore.nix

    ./modules/system-preferences.nix
    ./modules/dock.nix
  ];
}
