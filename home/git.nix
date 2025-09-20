{ pkgs, fullname, email, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
in
{
  programs.git = {
    enable = true;
    userName = fullname;
    userEmail = email;
    ignores = [
      "*~"
      "*.swp"
      ".Trash-*"
      "._*"
      "*.DS_Store"
      ".AppleDouble"
      ".LSOverride"
      ".DocumentRevisions-V100"
      ".fseventsd"
      ".Spotlight-V100"
      ".TemporaryItems"
      ".Trashes"
      ".VolumeIcon.icns"
      ".com.apple.timemachine.donotpresent"
    ];
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

  programs.mergiraf.enable = true;
}
