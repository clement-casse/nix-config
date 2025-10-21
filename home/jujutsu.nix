{ fullname, email, ... }: {
  programs.jujutsu = {
    enable = true;

    settings = {
      user.name = fullname;
      user.email = email;
    };
  };
}