{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    coreutils
    curl
    gettext
    vim
  ];
}
