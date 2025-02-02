{ lib, pkgs, ... }:
with lib;
let
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
in
{
  programs.ghostty = {
    enable = true;
    package = if isDarwin then null else pkgs.ghostty; # On darwin GhostTTY is installed via Homebrew
    enableZshIntegration = true;
    enableBashIntegration = true;
    settings = mkMerge [
      {
        theme = "nord";
        font-size = 12;
        font-family = "JetBrainsMono Nerd Font Mono";
        mouse-scroll-multiplier = 10;
        background-opacity = 0.7;
        background-blur-radius = 20;

        window-width = 150;
        window-height = 35;
        window-inherit-working-directory = true;
        window-step-resize = true;
      }

      (mkIf isDarwin {
        macos-non-native-fullscreen = "visible-menu";
        initial-window = false;
        quick-terminal-position = "top";
        quick-terminal-screen = "main";

        keybind = "global:ctrl+f12=toggle_quick_terminal";
      })
    ];
  };
}
