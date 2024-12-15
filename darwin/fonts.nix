{ pkgs, ... }: {
  #fontDir.enable = true;
  fonts = {
    packages = with pkgs; [
      dejavu_fonts
      source-sans-pro
      source-code-pro
    ] ++ [
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
    ];
  };
}