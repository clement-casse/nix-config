{ pkgs, inputs, system, username, ... }: {
  system.primaryUser = "${username}";
  system.configurationRevision = inputs.rev or inputs.dirtyRev or null;
  system.stateVersion = 5;
  nixpkgs.hostPlatform = system;
  nixpkgs.config.allowUnfree = true;

  environment.etc.darwin.source = inputs.nix-darwin;
  environment.pathsToLink = [ "/Applications" ];

  time.timeZone = "Europe/Paris";

  # Add ability to use TouchID for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;

  imports = [
    ./apps/packages.nix
    ./apps/homebrew.nix
    ./apps/appstore.nix

    ./system-preferences/apparence.nix
    ./system-preferences/finder.nix
    ./system-preferences/keyboard.nix
    ./system-preferences/trackpad.nix
    ./system-preferences/menu-bar.nix
    ./system-preferences/others.nix
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
      "/System/Applications/System Settings.app"
    ];
    persistent-others = [
      "/Users/${username}/Downloads"
    ];
  };
}
