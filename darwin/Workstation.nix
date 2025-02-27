{ inputs, system, ... }: {
  system.configurationRevision = inputs.rev or inputs.dirtyRev or null;
  system.stateVersion = 5;
  nixpkgs.hostPlatform = system;
  nixpkgs.config.allowUnfree = true;

  environment.etc.darwin.source = inputs.nix-darwin;
  environment.pathsToLink = [ "/Applications" ];

  time.timeZone = "Europe/Paris";

  imports = [
    ./system-preferences/apparence.nix
    ./system-preferences/finder.nix
    ./system-preferences/keyboard.nix
    ./system-preferences/trackpad.nix
    ./system-preferences/menu-bar.nix
  ];
}
