{ pkgs, ... }: {
  home.packages = with pkgs; [
    git
    gnupg
    nil
    kubectl
    helm
  ];
}
