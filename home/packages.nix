{ pkgs, ... }: {
  home.packages = with pkgs; [
    curl
    gettext
    htop
    kubectl
    nil
    uv
    vim
    wget

    buf
    grpcurl
    grpcui
  ];
}
