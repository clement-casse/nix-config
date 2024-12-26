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
      git = {
        inline_blame.enabled = true;
      };
      terminal = {
        font_family = "JetBrainsMono Nerd Font Mono";
        font_size = 14;
        line_height = "standard";
      };
      features = {
        copilot = false;
        inline_completion_provider = "none";
      };
      lsp = {
        nil.binary.path = "${pkgs.nil}/bin/nil";
      };
      telemetry.metrics = false;
    };
  };
}