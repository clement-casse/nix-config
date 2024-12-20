{ pkgs, inputs, ... }: {
  system.configurationRevision = inputs.rev or inputs.dirtyRev or null;
  system.stateVersion = 5;
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;
  time.timeZone = "Europe/Paris";

  environment.etc.darwin.source = inputs.nix-darwin;
  environment.pathsToLink = [ "/Applications" ];

  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;

  environment.shells = with pkgs; [
    zsh
    bashInteractive
    nushell
  ];

  environment.systemPackages = with pkgs; [
    curl
    gettext
    git
    gnupg
    jq
    vim
  ];
}