{ pkgs, ... }: {
  home.packages = with pkgs; [
    curl
    gettext
    htop
    kubectl
    nil
    vim
    wget

    bacon
    buf
    grpcurl
    grpcui
  ];
}
