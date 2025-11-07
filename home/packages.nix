{ pkgs, ... }: {
  home.packages = with pkgs; [
    curl
    gettext
    htop
    kubectl
    nil
    vim
    wget

    buf
    grpcurl
    grpcui
  ];
}
