{ pkgs, ... }: {
  ## macOS very generic settings
  system.defaults.NSGlobalDomain = {
    AppleFontSmoothing = 2; # 2 = heavy font smoothing; if text looks blurry, back this down to 1

    # Whether to automatically switch between light and dark mode. The default is false.
    AppleInterfaceStyleSwitchesAutomatically = true;
    #AppleInterfaceStyle = "Dark"; # If AppleInterfaceStyleSwitchesAutomatically is false the Dark theme can be manually applied here.
  };

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
      "${pkgs.vscodium}/Applications/VSCodium.app"
      "${pkgs.zed-editor}/Applications/Zed.app"
      "/System/Applications/Passwords.app"
      "/System/Applications/App Store.app"
      "/System/Applications/System Settings.app"
    ];
  };

  ## Finder
  system.defaults.finder = {
    FXPreferredViewStyle = "clmv"; # Change the default finder view. “icnv” = Icon view, “Nlsv” = List view, “clmv” = Column View, “Flwv” = Gallery View The default is icnv.
    ShowHardDrivesOnDesktop = true;
    ShowRemovableMediaOnDesktop = true;
    ShowMountedServersOnDesktop = true;
    _FXSortFoldersFirstOnDesktop = true;
  };
  system.defaults.CustomUserPreferences."com.apple.finder" = {
    ShowExternalHardDrivesOnDesktop = true;
    ShowHardDrivesOnDesktop = true;
    ShowMountedServersOnDesktop = true;
    ShowRemovableMediaOnDesktop = true;
    _FXSortFoldersFirst = true;
  };

  ## Trackpad related settings
  system.defaults.trackpad = {
    Clicking = false;
    TrackpadRightClick = true;
    TrackpadThreeFingerDrag = false;
  };
  system.defaults.NSGlobalDomain = {
    # Enables swiping left or right with two fingers to navigate backward or forward. The default is true.
    AppleEnableMouseSwipeNavigateWithScrolls = true;
    AppleEnableSwipeNavigateWithScrolls = true;
    "com.apple.swipescrolldirection" = true;  # enable natural scrolling(default to true)
  };

  # Keyboard related settings
  system.defaults.NSGlobalDomain = {
    # Configures the keyboard control behavior. Mode 3 enables full keyboard control.
    AppleKeyboardUIMode = 3;

    # If you press and hold certain keyboard keys when in a text area, the key’s character begins to repeat.
    # For example, the Delete key continues to remove text for as long as you hold it down.
    # Whether to enable the press-and-hold feature. The default is true.
    ApplePressAndHoldEnabled = false;
    # This sets how long you must hold down the key before it starts repeating.
    InitialKeyRepeat = 25;
    # This sets how fast it repeats once it starts.
    KeyRepeat = 2;

    # Use F1, F2, etc. keys as standard function keys.
    "com.apple.keyboard.fnState" = true;
  };
  system.defaults.hitoolbox.AppleFnUsageType = "Do Nothing";

  system.defaults.CustomUserPreferences = {
    "com.apple.AdLib".allowApplePersonalizedAdvertising = false;
    "com.apple.commerce".AutoUpdate = true;
  };
}
