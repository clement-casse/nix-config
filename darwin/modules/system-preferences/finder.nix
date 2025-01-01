_: {
  ## Finder related configuration
  system.defaults.NSGlobalDomain.NSTableViewDefaultSizeMode = 2; # Sets the size of the finder sidebar icons: 1 (small), 2 (medium) or 3 (large). The default is 3.
  system.defaults.finder = {
    ShowPathbar = true;
    ShowStatusBar = false;
    AppleShowAllFiles = false;
    FXRemoveOldTrashItems = true;
    QuitMenuItem = false;

    NewWindowTarget = "Home";
    FXPreferredViewStyle = "clmv"; # Change the default finder view. “icnv” = Icon view, “Nlsv” = List view, “clmv” = Column View, “Flwv” = Gallery View The default is icnv.
    _FXSortFoldersFirst = true;

    ShowExternalHardDrivesOnDesktop = true;
    ShowHardDrivesOnDesktop = true;
    ShowRemovableMediaOnDesktop = true;
    ShowMountedServersOnDesktop = true;
    _FXSortFoldersFirstOnDesktop = true;
  };
  system.defaults.CustomUserPreferences = {
    "com.apple.desktopservices" = {
      DSDontWriteNetworkStores = true; # Avoid creating .DS_Store files on network volumes
      DSDontWriteUSBStores = true; # Avoid creating .DS_Store files on USB volumes
    };
  };
}
