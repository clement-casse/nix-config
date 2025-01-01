_: {
  ## macOS very generic settings
  system.defaults.NSGlobalDomain = {
    AppleTemperatureUnit = "Celsius";
    AppleMeasurementUnits = "Centimeters";
    AppleMetricUnits = 1;

    AppleFontSmoothing = 2; # 2 = heavy font smoothing; if text looks blurry, back this down to 1

    # Whether to automatically switch between light and dark mode. The default is false.
    AppleInterfaceStyleSwitchesAutomatically = true;
    #AppleInterfaceStyle = "Dark"; # If AppleInterfaceStyleSwitchesAutomatically is false the Dark theme can be manually applied here.
    _HIHideMenuBar = false; # Whether to autohide the menu bar.
  };

  ## macOS Dock configuration
  system.defaults.dock = {
    autohide = false;
    expose-group-apps = false;
    orientation = "bottom";
    show-process-indicators = true;
    show-recents = false;
    minimize-to-application = false;
    scroll-to-open = true;
  };

  ## Hot corner actions
  # Valid values are:
  # 1: Disabled             2: Mission Control
  # 3: Application Windows  4: Desktop
  # 5: Start Screen Saver   6: Disable Screen Saver
  # 7: Dashboard            10: Put Display to Sleep
  # 11: Launchpad           12: Notification Center
  # 13: Lock Screen         14: Quick Note
  system.defaults.dock = {
    wvous-tl-corner = 1;  # Top Left Corner
    wvous-tr-corner = 12; # Top Right Corner
    wvous-bl-corner = 1;  # Bottom Left Corner
    wvous-br-corner = 1;  # Bottom Right Corner
  };
}
