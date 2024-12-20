{ inputs, username, lib, pkgs, ... }: {
  time.timeZone = "Europe/Paris";

  nix = {
    package = pkgs.nix;
    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
      experimental-features = nix-command flakes
      extra-platforms = x86_64-darwin aarch64-darwin
    '';

    configureBuildUsers = true; # auto manage nixbld users with nix darwin

    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };

    settings = {
      sandbox = false; # Sandbox and macos do not play well together
      max-jobs = 8;
      cores = 0;
      trusted-users = ["${username}" "root" "@admin" "@wheel"];
      allowed-users = ["@wheel"];
      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
        "https://zmre.cachix.org"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "zmre.cachix.org-1:WIE1U2a16UyaUVr+Wind0JM6pEXBe43PQezdPKoDWLE="
      ];
    };
  };

  environment = {
    pathsToLink = [ "/Applications" ];
    systemPath = [ "/opt/homebrew/bin" "/opt/homebrew/sbin" ];
    etc = {
      darwin.source = "${inputs.darwin}";
    };
    systemPackages = with pkgs; [
      git
      curl
      coreutils
    ];
  };

  system.defaults = {

    loginwindow = {
      GuestEnabled = false; # disable guest account
      SHOWFULLNAME = false; # show name instead of username
      DisableConsoleAccess = true; # Disables the ability for a user to access the console by typing “>console” for a username at the login window.
    };

    finder = {
      FXPreferredViewStyle = "clmv"; # Change the default finder view. “icnv” = Icon view, “Nlsv” = List view, “clmv” = Column View, “Flwv” = Gallery View The default is icnv.
    };

    NSGlobalDomain = {
      AppleFontSmoothing = 2; # 2 = heavy font smoothing; if text looks blurry, back this down to 1
      AppleInterfaceStyle = "Dark"; # Dark mode
      AppleInterfaceStyleSwitchesAutomatically = false; # auto switch between light/dark mode

      AppleTemperatureUnit = "Celsius";
      AppleMeasurementUnits = "Centimeters";
    };

    CustomUserPreferences = {
      "com.apple.desktopservices" = {
        DSDontWriteNetworkStores = true; # Avoid creating .DS_Store files on network volumes
        DSDontWriteUSBStores = true; # Avoid creating .DS_Store files on USB volumes
      };
      "com.apple.screensaver" = {
        askForPassword = 1;
        askForPasswordDelay = 5;
      };
      "com.apple.AdLib".allowApplePersonalizedAdvertising = false;
      "com.apple.print.PrintingPrefs"."Quit When Finished" = true; # Automatically quit printer app once the print jobs complete
      "com.apple.ImageCapture".disableHotPlug = true; # Prevent Photos from opening automatically when devices are plugged in
      "com.apple.commerce".AutoUpdate = true; # Turn on app auto-update
    };
  };

  fonts = {
    #fontDir.enable = true;
    fonts = with pkgs; [
      source-sans-pro
      vistafonts # needed for msoffice
    ];
  };

  # homebrew = {
  #   enable = true;
  #   masApps = { # Applications to install from Mac App Store using mas.
  #     "Mona" = 1659154653;
  #     "Tailscale" = 1475387142;
  #     "The Unarchiver" = 425424353;

  #     # Microsoft Office Stuff
  #     "OneDrive" = 823766827;
  #     "Microsoft PowerPoint" = 462062816;
  #     "Microsoft Excel" = 462058435;
  #     "Microsoft Word" = 462054704;

  #     # XCode because ... reasons
  #     "Xcode" = 497799835;
  #   };
  #   cask = [
  #     # Main Tools
  #     "firefox"
  #     "vlc"
  #     "signal"
  #     "discord"

  #     # Development Tools
  #     "iterm2"
  #     "orbstack"
  #     "vscodium"

  #     # Some Gaming Tools
  #     "xiv-on-mac"
  #     "nvidia-geforce-now"
  #     "steam"
  #   ];
  # };
}
