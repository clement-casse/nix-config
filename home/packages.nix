{ pkgs, ... }: {
  home.packages = with pkgs; [
    git
    gnupg
    jq
    nil
    kubectl
    helm
  ];
}
