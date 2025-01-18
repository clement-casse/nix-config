_: {
  # Keyboard related settings
  system.defaults.hitoolbox.AppleFnUsageType = "Do Nothing";
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

    NSAutomaticCapitalizationEnabled = true; # Whether to enable automatic capitalization.
    NSAutomaticInlinePredictionEnabled = false; # Whether to enable inline predictive text.
    NSAutomaticDashSubstitutionEnabled = false; # Whether to enable smart dash substitution.
    NSAutomaticPeriodSubstitutionEnabled = false; # Whether to enable smart period substitution.
    NSAutomaticQuoteSubstitutionEnabled = true; # Whether to enable smart quote substitution.
    NSAutomaticSpellingCorrectionEnabled = false; # Whether to enable automatic spelling correction.
  };
}
