{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    enableVteIntegration = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;
    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignorePatterns = [ ];
      ignoreSpace = true;
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };

  programs.eza = {
    enable = true;
    icons = "auto";
    git = true;
    extraOptions = [ "--group-directories-first" "--links" "--header" "--git" "--classify" "-a" ];
    enableZshIntegration = true;
    enableBashIntegration = true;
    enableNushellIntegration = false;
  };

  programs.pay-respects = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    options = [ "--cmd cd" ];
    enableZshIntegration = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };

  home.file.".hushlogin".text = "";
}
