_: {
  ## macOS very generic settings
  system.defaults.NSGlobalDomain = {
    AppleFontSmoothing = 2; # 2 = heavy font smoothing; if text looks blurry, back this down to 1
    AppleTemperatureUnit = "Celsius";
    AppleMeasurementUnits = "Centimeters";

    # Whether to automatically switch between light and dark mode. The default is false.
    AppleInterfaceStyleSwitchesAutomatically = true;
    #AppleInterfaceStyle = "Dark"; # If AppleInterfaceStyleSwitchesAutomatically is false the Dark theme can be manually applied here.
  };
  system.defaults.CustomUserPreferences."com.apple.desktopservices" = {
    DSDontWriteNetworkStores = true; # Avoid creating .DS_Store files on network volumes
    DSDontWriteUSBStores = true; # Avoid creating .DS_Store files on USB volumes
  };

  ## Finder
  system.defaults.finder = {
    FXPreferredViewStyle = "clmv"; # Change the default finder view. “icnv” = Icon view, “Nlsv” = List view, “clmv” = Column View, “Flwv” = Gallery View The default is icnv.
    ShowHardDrivesOnDesktop = true;
    ShowMountedServersOnDesktop = true;
    ShowPathbar = true;
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
    TrackpadThreeFingerDrag = true;
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

    # Typing susbstitution settings:
    NSAutomaticCapitalizationEnabled = true; # Whether to enable automatic capitalization.
    NSAutomaticInlinePredictionEnabled = false; # Whether to enable inline predictive text.
    NSAutomaticDashSubstitutionEnabled = false; # Whether to enable smart dash substitution. 
    NSAutomaticPeriodSubstitutionEnabled = false; # Whether to enable smart period substitution.
    NSAutomaticQuoteSubstitutionEnabled = true; # Whether to enable smart quote substitution.
    NSAutomaticSpellingCorrectionEnabled = false; # Whether to enable automatic spelling correction.
  };

  system.defaults.CustomUserPreferences = {
    "com.apple.AdLib".allowApplePersonalizedAdvertising = false;
    "com.apple.commerce".AutoUpdate = true;
  };
}