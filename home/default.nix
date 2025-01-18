{ pkgs, username, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
in
{
  home.stateVersion = "24.11";
  home.username = username;
  home.homeDirectory = if isDarwin then "/Users/${username}" else "/home/${username}";

  programs.home-manager.enable = true;

  imports = [
    ./shells.nix
    ./services.nix
    ./git.nix
    ./ghostty.nix
    ./vscode.nix
    ./zed.nix
  ];
}
