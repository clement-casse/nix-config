{ pkgs, ... }: {
  programs.zed-editor = {
    enable = true;

    extensions = [
      "cypher"
      "dockerfile"
      "nickel"
      "nix"
    ];

    userSettings = {
      scrollbar.show = "system";
      load_direnv = "direct";
      ui_font_size = 16;
      buffer_font_size = 14;
      inlay_hints = {
        enabled = true;
        show_type_hints = true;
        show_parameter_hints = true;
        show_other_hints = true;
      };
      git = {
        inline_blame.enabled = true;
      };
      terminal = {
        font_family = "JetBrainsMono Nerd Font Mono";
        font_size = 14;
        line_height = "standard";
      };
      features = {
        copilot = true;
        inline_completion_provider = "copilot";
      };
      lsp = {
        nil.binary.path = "${pkgs.nil}/bin/nil";
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
