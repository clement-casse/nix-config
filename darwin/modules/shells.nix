{ pkgs, ... }: {
  environment.shells = with pkgs; [
    zsh
    bashInteractive
    nushell
  ];
}
