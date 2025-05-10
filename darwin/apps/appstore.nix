_: {
  # Applications to install from Mac App Store using [mas](https://github.com/mas-cli/mas).
  homebrew.masApps = {
    "Tailscale" = 1475387142;
    "The Unarchiver" = 425424353;
  };

  system.defaults.CustomUserPreferences = {
    "com.apple.commerce".AutoUpdate = true;
    "com.apple.SoftwareUpdate" = {
      AutomaticCheckEnabled = true;
      ScheduleFrequency = 1;
      AutomaticDownload = 1; # Download newly available updates in background
      CriticalUpdateInstall = 1; # Install System data files & security updates
    };
  };
}
