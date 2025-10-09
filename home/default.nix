{ pkgs, username, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
in
{
  home.stateVersion = "24.11";
  home.username = username;
  home.homeDirectory = if isDarwin then "/Users/${username}" else "/home/${username}";
  home.preferXdgDirectories = true;

  programs.home-manager.enable = true;

  imports = [
    ./fabric.nix
    ./firefox.nix
    ./fonts.nix
    ./ghostty.nix
    ./git.nix
    ./jujutsu.nix
    ./packages.nix
    ./services.nix
    ./shells.nix
    ./vscode.nix
    ./xdg.nix
  ];
}
