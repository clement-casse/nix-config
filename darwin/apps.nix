_: {
  homebrew.enable = true;
  homebrew.onActivation = {
    autoUpdate = true; # Fetch the newest stable branch of Homebrew's git repo
    upgrade = true; # Upgrade outdated casks, formulae, and App Store apps
    # cleanup = "zap"; # uninstalls all formulae(and related files) not listed in the generated Brewfile
  };

  # Applications to install from Mac App Store using [mas](https://github.com/mas-cli/mas).
  homebrew.masApps = {
    "Tailscale" = 1475387142;
    "The Unarchiver" = 425424353;
    "reMarkable desktop" = 1276493162;
  };

  homebrew.casks = [
    "iterm2"
    "netnewswire"
    "vlc"
    "zotero"

    "discord"
    "signal"

    "nvidia-geforce-now"
    "steam"
  ];
}