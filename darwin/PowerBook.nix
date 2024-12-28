{ pkgs, inputs, system, ... }: {
  system.configurationRevision = inputs.rev or inputs.dirtyRev or null;
  system.stateVersion = 5;
  nixpkgs.hostPlatform = system;
  nixpkgs.config.allowUnfree = true;
  time.timeZone = "Europe/Paris";

  environment.etc.darwin.source = inputs.nix-darwin;
  environment.pathsToLink = [ "/Applications" ];

  # Add ability to use TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;

  environment.systemPackages = with pkgs; [
    coreutils
    curl
    gettext
    vim
  ];

  imports = [
    ./modules/nix.nix
    ./modules/shells.nix
    ./modules/fonts.nix
    ./modules/users.nix

    ./modules/homebrew.nix

    ./modules/system-preferences.nix
    ./modules/dock.nix
  ];
}
