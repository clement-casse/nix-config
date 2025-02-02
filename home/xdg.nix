{ config, pkgs, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
in
{
  xdg = {
    enable = true;
    userDirs = {
      enable = !isDarwin;

      desktop = "${config.home.homeDirectory}/Desktop";
      documents = "${config.home.homeDirectory}/Documents";
      download = "${config.home.homeDirectory}/Downloads";
      music = "${config.home.homeDirectory}/Music";
      pictures = "${config.home.homeDirectory}/Pictures";
      videos = "${config.home.homeDirectory}/Videos";
      publicShare = "${config.home.homeDirectory}/Public";
    };
  };
}
