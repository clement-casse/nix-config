{ pkgs, ... }: {
  home.packages = with pkgs; [ iterm2 ];
  # home.file."".source = "";
}
