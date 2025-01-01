{ inputs, system, ... }: {
  system.configurationRevision = inputs.rev or inputs.dirtyRev or null;
  system.stateVersion = 5;
  nixpkgs.hostPlatform = system;
  nixpkgs.config.allowUnfree = true;

  environment.etc.darwin.source = inputs.nix-darwin;
  environment.pathsToLink = [ "/Applications" ];

  time.timeZone = "Europe/Paris";

  # Add ability to use TouchID for sudo authentication
  #security.pam.enableSudoTouchIdAuth = true;

  imports = [
    ./modules/nix.nix
    ./modules/shells.nix
    ./modules/fonts.nix
    ./modules/users.nix

    ./modules/system-preferences/apparence.nix
    ./modules/system-preferences/finder.nix
    ./modules/system-preferences/keyboard.nix
    ./modules/system-preferences/trackpad.nix
    ./modules/system-preferences/menu-bar.nix
  ];
}
