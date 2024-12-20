_: {
  # Set macOS user defaults.
  targets.darwin.defaults = {
    NSGlobalDomain = {
      AppleTemperatureUnit = "Celsius";
      AppleMeasurementUnits = "Centimeters";

    };
    "com.apple.desktopservices" = {
      DSDontWriteNetworkStores = true; # Avoid creating .DS_Store files on network volumes
      DSDontWriteUSBStores = true; # Avoid creating .DS_Store files on USB volumes
    };
    "com.apple.finder" = {
      FXRemoveOldTrashItems = true;
      ShowPathbar = true;
      ShowStatusBar = false;
    };
    "com.apple.menuextra.clock".Show24Hour = true;
  };

  # Typing susbstitution settings:
  targets.darwin.defaults.NSGlobalDomain = {
    NSAutomaticCapitalizationEnabled = true; # Whether to enable automatic capitalization.
    NSAutomaticInlinePredictionEnabled = false; # Whether to enable inline predictive text.
    NSAutomaticDashSubstitutionEnabled = false; # Whether to enable smart dash substitution.
    NSAutomaticPeriodSubstitutionEnabled = false; # Whether to enable smart period substitution.
    NSAutomaticQuoteSubstitutionEnabled = true; # Whether to enable smart quote substitution.
    NSAutomaticSpellingCorrectionEnabled = false; # Whether to enable automatic spelling correction.
  };

  # Safari Settings.
  targets.darwin.search = "DuckDuckGo";
  targets.darwin.defaults."com.apple.Safari" = {
    AutoFillPasswords = true;
    IncludeDevelopMenu = true;
  };
}
