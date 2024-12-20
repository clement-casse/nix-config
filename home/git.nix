{ pkgs, username, ... }: {
  programs = {
    git = {
      enable = true;
      userName = "Clément Cassé";
      ignores = [ "*~" "*.swp" ".DS_Store" ];
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}