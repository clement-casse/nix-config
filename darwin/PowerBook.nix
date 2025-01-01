{ pkgs, inputs, system, username, ... }: {
  system.configurationRevision = inputs.rev or inputs.dirtyRev or null;
  system.stateVersion = 5;
  nixpkgs.hostPlatform = system;
  nixpkgs.config.allowUnfree = true;

  environment.etc.darwin.source = inputs.nix-darwin;
  environment.pathsToLink = [ "/Applications" ];

  time.timeZone = "Europe/Paris";

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

    ./modules/system-preferences/apparence.nix
    ./modules/system-preferences/finder.nix
    #./modules/system-preferences/safari.nix
    ./modules/system-preferences/keyboard.nix
    ./modules/system-preferences/trackpad.nix
    ./modules/system-preferences/menu-bar.nix
    ./modules/system-preferences/others.nix
  ];

  system.defaults.dock = {
    persistent-apps = [
      "/System/Applications/Launchpad.app"
      "/System/Applications/Mail.app"
      "/Applications/Safari.app"
      "/System/Applications/Calendar.app"
      "/System/Applications/Messages.app"
      "/System/Applications/Music.app"
      "/System/Applications/Photos.app"
      "${pkgs.vscode}/Applications/Visual Studio Code.app"
      "${pkgs.zed-editor}/Applications/Zed.app"
      "/Applications/Ghostty.app"
      "/System/Applications/Passwords.app"
      "/System/Applications/App Store.app"
      "/System/Applications/System Settings.app"
    ];
    persistent-others = [
      "/Users/${username}/Downloads"
    ];
  };
}
