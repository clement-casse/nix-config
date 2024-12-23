_: {
  homebrew.enable = true;

  # Applications to install from Mac App Store using [mas](https://github.com/mas-cli/mas).
  homebrew.masApps = {
    "Tailscale" = 1475387142;
    "The Unarchiver" = 425424353;
    "reMarkable desktop" = 1276493162;
  };

  homebrew.casks = [
    "discord"
    "iterm2"
    "zotero"

    "nvidia-geforce-now"
    "steam"
  ];
}