{ pkgs, username, fullname, ... }: {
  users.users."${username}" = {
    name = username;
    home = "/Users/${username}";
    description = fullname;
    shell = pkgs.zsh;
  };
}
