_: {
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
    "com.apple.swipescrolldirection" = true; # enable natural scrolling(default to true)
  };
}
