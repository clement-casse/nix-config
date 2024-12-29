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
}