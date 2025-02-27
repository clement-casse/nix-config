{ pkgs, fullname, email, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
in
{
  programs.git = {
    enable = true;
    userName = fullname;
    userEmail = email;
    ignores = [ "*~" "*.swp" ".DS_Store" ];
    extraConfig = {
      help.autocorrect = "prompt";
      init.defaultBranch = "main";
      branch.sort = "-committerdate";
      tag.sort = "version:refname";
      core.autocrlf = "input";
      push.autoSetupRemote = true;
      push.followTags = true;
      fetch.prune = true;
      fetch.pruneTags = true;
      fetch.all = true;
      rebase.autoSquash = true;
      rebase.autoStash = true;
      rebase.updateRefs = true;
      credential.helper = if isDarwin then "osxkeychain" else "store";
    };
  };
}
