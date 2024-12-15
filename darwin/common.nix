{ pkgs, inputs, ... }: {
  system.configurationRevision = inputs.rev or inputs.dirtyRev or null;
  system.stateVersion = 5;
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;
  time.timeZone = "Europe/Paris";

  environment.etc.darwin.source = inputs.nix-darwin;
  environment.pathsToLink = [ "/Applications" ];

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