{ pkgs, ... }: {
  programs.zed-editor = {
    enable = true;

    extraPackages = with pkgs; [
      nixd
      nil
    ];

    extensions = [
      "cypher"
      "dockerfile"
      "golangci-lint"
      "gosum"
      "make"
      "nickel"
      "nix"
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
      relative_line_numbers = true;
      soft_wrap = "editor_width";
      indent_guides = {
        enabled = true;
        coloring = "indent_aware";
      };
      inlay_hints = {
        enabled = true;
        show_type_hints = true;
        show_parameter_hints = true;
        show_other_hints = false;
        show_background = true;
      };
      git = {
        inline_blame.enabled = true;
        inline_blame.delay_ms = 1000;
      };
      terminal = {
        font_family = "JetBrainsMono Nerd Font Mono";
        font_size = 12;
        line_height = "standard";
        env.EDITOR = "zed --wait";
      };
      minimap = {
        show = "auto";
      };
      icon_theme = {
        mode = "system";
        dark = "Zed (Default)";
        light = "Zed (Default)";
      };
      languages = {
        Nix = {
          language_servers = [ "nil" "!nixd" ];
          tab_size = 2;
        };
      };
      lsp = {
        nil = {
          initialization_options = {
            formatting.command = [ "nix" "fmt" ];
          };
          settings = {
            diagnostics.ingored = [ ];
          };
        };
      };
      file_scan_exclusions = [
        "**/.git"
        "**/.svn"
        "**/.hg"
        "**/CVS"
        "**/.DS_Store"
        "**/Thumbs.db"
        "**/.classpath"
        "**/.settings"
        "**/.vscode"
        "**/.idea"
        "**/.vscode-insiders"
        "**/.direnv"
      ];
      telemetry.metrics = false;
      telemetry.diagnostics = false;
      language_models = {
        openai = {
          version = "1";
          api_url = "https://codestral.mistral.ai/v1";
          available_models = [
            {
              name = "codestral-2501";
              display_name = "Codestral 25.01";
              max_tokens = 131072;
            }
            {
              name = "codestral-2405";
              display_name = "Codestral 24.05";
              max_tokens = 131072;
            }
            {
              name = "codestral-mamba-2407";
              display_name = "Codestral Mamba 24.07";
              max_tokens = 131072;
            }
            {
              name = "mistral-large-2402";
              display_name = "Mistral Large 24.02";
              max_tokens = 131072;
            }
            {
              name = "mistral-large-2407";
              display_name = "Mistral Large 24.07";
              max_tokens = 131072;
            }
            {
              name = "mistral-large-2411";
              display_name = "Mistral Large 24.11";
              max_tokens = 131072;
            }
          ];
        };
      };
      assistant = {
        version = "2";
        enabled = true;
        button = true;
        default_model = {
          provider = "openai";
          model = "codestral-2501";
        };
        inline_assistant_model = {
          provider = "openai";
          model = "codestral-2501";
        };
        commit_message_model = {
          provider = "openai";
          model = "mistral-large-2411";
        };
        thread_summary_model = {
          provider = "openai";
          model = "mistral-large-2411";
        };
      };
    };
  };
}
