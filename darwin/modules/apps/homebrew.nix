_: {
  # Add homebrew installation directories to the system path to make homebrew binaries available in the shell.
  environment.systemPath = [ "/opt/homebrew/bin" "/opt/homebrew/sbin" ];

  homebrew.enable = true;
  homebrew.onActivation = {
    autoUpdate = true; # Fetch the newest stable branch of Homebrew's git repo
    upgrade = true; # Upgrade outdated casks, formulae, and App Store apps
    cleanup = "zap"; # uninstalls all formulae(and related files) not listed in the generated Brewfile
  };

  homebrew.casks = [
    "iterm2" # TODO Remove once Ghostty is adopted
    "ghostty"
    "brave-browser"
    "orbstack"
    "netnewswire"
    "vlc"
    "zotero"

    "discord"
    "signal"

    "nvidia-geforce-now"
    "steam"
  ];
}