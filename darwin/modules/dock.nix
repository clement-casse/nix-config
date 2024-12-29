{ pkgs, username, ... }: {
  ## macOS Dock configuration
  system.defaults.dock = {
    autohide = false;
    expose-group-apps = false;
    orientation = "bottom";
    show-process-indicators = true;
    show-recents = false;
    minimize-to-application = false;
    scroll-to-open = true;
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
      "/System/Applications/Passwords.app"
      "/System/Applications/App Store.app"
      "/System/Applications/System Settings.app"
    ];
    persistent-others = [
      "/Users/${username}/Downloads"
    ];
  };
}
