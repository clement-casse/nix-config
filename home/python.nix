_: {
  programs.uv = {
    enable = true;
    settings = {};
  };

  programs.ruff = {
    enable = true;
    settings = {
      line-length = 100;
    };
  };
}