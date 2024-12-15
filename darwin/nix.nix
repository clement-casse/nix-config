{ username, ... }: {
  services.nix-daemon.enable = true;

  nix = {
    gc.automatic = true;
    optimise.automatic = true;
    settings = {
      experimental-features = "nix-command flakes";
      sandbox = false; # Sandbox and macos do not play well together
      max-jobs = "auto";
      cores = 0;
      allowed-users = [ "root" "@admin" "@staff" username ];
      trusted-users = [ username ];
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
}