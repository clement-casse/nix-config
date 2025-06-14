{ pkgs, ... }: {
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    dejavu_fonts
    source-sans-pro
    source-code-pro
    nerd-fonts.fira-code
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
  ];
}
