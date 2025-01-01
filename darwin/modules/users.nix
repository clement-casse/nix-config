{ pkgs, username, fullname, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
in
{
  users.users."${username}" = {
    name = username;
    home = if isDarwin then "/Users/${username}" else "/home/${username}";
    description = fullname;
    shell = pkgs.zsh;
  };
}
