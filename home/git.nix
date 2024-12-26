{ pkgs, fullname, email, ... }: {
  programs = {
    git = {
      enable = true;
      userName = fullname;
      userEmail = email;
      ignores = [ "*~" "*.swp" ".DS_Store" ];
      extraConfig = {
        init.defaultBranch = "main";
        branch.sort = "-committerdate";
        core.autocrlf = "input";
        push.autoSetupRemote = true;
      };
    };
  };
}