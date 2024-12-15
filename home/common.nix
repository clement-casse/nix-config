{ pkgs, ... }: {
  home.stateVersion = "24.11";

  programs = {
    home-manager.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    zsh = {
      enable = true;
      autocd = true;
      enableCompletion = true;
      enableVteIntegration = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh.enable = true;
    };

    git = {
      enable = true;
      userName = "Clément Cassé";
      ignores = [ "*~" ".DS_Store" ];
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}