{ pkgs, ... }: {
  home.packages = with pkgs; [
    curl
    gettext
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
