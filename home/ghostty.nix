{ lib, pkgs, ... }: 
let
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
in {
  xdg.configFile = {
    "ghostty/config".text = ''
      font-family = 'JetBrainsMono Nerd Font Mono'
      font-size = 12
      theme = nord
      mouse-scroll-multiplier = 10
      background-opacity = 0.7
      background-blur-radius = 20

      window-width = 150
      window-height = 35
      window-inherit-working-directory = true
      window-step-resize = true

      config-file = ?config-macos
    '';

    "ghostty/config-macos".text = lib.mkIf isDarwin ''
      macos-non-native-fullscreen = visible-menu
      initial-window = false
      quick-terminal-position = top
      quick-terminal-screen = main

      keybind = global:ctrl+f12=toggle_quick_terminal
    '';
  };
}