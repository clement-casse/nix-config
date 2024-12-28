{ username, ... }: {
  home.stateVersion = "24.11";
  home.username = username;
  home.homeDirectory = "/Users/${username}";

  programs.home-manager.enable = true;

  imports = [
    ./shells.nix
    ./services.nix
    ./git.nix

    ./darwin.nix

    ./vscode.nix
    ./zed.nix
  ];
}
