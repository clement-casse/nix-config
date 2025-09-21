_: {
  ## macOS very generic settings
  system.defaults.NSGlobalDomain = {
    AppleTemperatureUnit = "Celsius";
    AppleMeasurementUnits = "Centimeters";
    AppleMetricUnits = 1;

    AppleFontSmoothing = 2; # 2 = heavy font smoothing; if text looks blurry, back this down to 1

    # Whether to automatically switch between light and dark mode. The default is false.
    AppleInterfaceStyleSwitchesAutomatically = true;
    AppleIconAppearanceTheme = "ClearAutomatic";
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
    wvous-tl-corner = 1; # Top Left Corner
    wvous-tr-corner = 1; # Top Right Corner
    wvous-bl-corner = 1; # Bottom Left Corner
    wvous-br-corner = 1; # Bottom Right Corner
  };

  ## Traditional Window Manager options (i.e. not Stage manager)
  system.defaults.WindowManager = {
    StandardHideDesktopIcons = null; # Hide items on desktop.
    StandardHideWidgets = null; # Hide widgets on desktop.
  };

  ## Stage Manager related configuration
  system.defaults.WindowManager = {
    GloballyEnabled = null; # Enable Stage Manager Stage Manager arranges your recent windows into a single strip for reduced clutter and quick access.
    EnableStandardClickToShowDesktop = false; # Click wallpaper to reveal desktop Clicking your wallpaper will move all windows out of the way to allow access to your desktop items and widgets. Default is true. false means “Only in Stage Manager” true means “Always”

    AppWindowGroupingBehavior = null; # false means “One at a time” true means “All at once”
    AutoHide = null; # Auto hide stage strip showing recent apps.
    EnableTiledWindowMargins = null; # Enable Window Margins.
    HideDesktop = null; # Hide items in Stage Manager.
    StageManagerHideWidgets = null; # Hide widgets in Stage Manager.
  };
}
