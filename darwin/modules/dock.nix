{ pkgs, ... }: {
  ## macOS Dock configuration
  system.defaults.dock = {
    show-process-indicators = true;
    show-recents = false;
    minimize-to-application = false;
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
  };
}
