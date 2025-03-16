_: {
  programs.zed-editor = {
    enable = true;

    extensions = [
      "cypher"
      "dockerfile"
      "make"
      "nickel"
      "nix"
      "golangci-lint"
      "gosum"
      "proto"
      "toml"
    ];

    userSettings = {
      hour_format = "hour24";
      auto_update = false;
      scrollbar.show = "system";
      load_direnv = "direct";
      ui_font_size = 16;
      buffer_font_size = 14;
      inlay_hints = {
        enabled = true;
        show_type_hints = true;
        show_parameter_hints = true;
        show_other_hints = false;
        show_background = true;
      };
      git = {
        inline_blame.enabled = true;
      };
      terminal = {
        font_family = "JetBrainsMono Nerd Font Mono";
        font_size = 12;
        line_height = "standard";
      };
      features = {
        copilot = true;
        inline_completion_provider = "copilot";
      };
      languages = {
        Nix = {
          language_servers = [ "nil" "!nixd" ];
        };
      };
      telemetry.metrics = false;
    };
  };
}
