{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs; [
      # Extensions
      vscode-extensions.mkhl.direnv
      vscode-extensions.bbenoist.nix
      vscode-extensions.jnoortheen.nix-ide
      vscode-extensions.arrterian.nix-env-selector
      vscode-extensions.editorconfig.editorconfig
      vscode-extensions.redhat.vscode-yaml
      vscode-extensions.ms-kubernetes-tools.vscode-kubernetes-tools
      vscode-extensions.tamasfe.even-better-toml
      vscode-extensions.rust-lang.rust-analyzer
      vscode-extensions.zxh404.vscode-proto3
      vscode-extensions.thenuprojectcontributors.vscode-nushell-lang
      vscode-extensions.golang.go
      vscode-extensions.nvarner.typst-lsp

      # Themes
      vscode-extensions.teabyii.ayu
      vscode-extensions.arcticicestudio.nord-visual-studio-code
    ];

    userSettings = {
      "window.autoDetectColorScheme" = true;
      "workbench.preferredDarkColorTheme" = "Nord";
      "workbench.preferredLightColorTheme" = "Ayu Light";
      "workbench.tips.enabled" = false;

      "editor.fontSize" = 14;
      "editor.fontFamily" = "'JetBrainsMono Nerd Font Mono', Menlo, Monaco, 'Courier New', monospace";
      "editor.fontLigatures" = true;
      "editor.lineHeight" = 1.7;
      "editor.renderControlCharacters" = true;
      "editor.renderWhitespace" = "boundary";
      "editor.guides.bracketPairs" = true;
      "editor.inlayHints.fontFamily" = "'JetBrainsMono Nerd Font Mono Thin', Menlo, Monaco, 'Courier New', monospace";
      "editor.inlayHints.padding" = true;
      "editor.inlayHints.fontSize" = 10;
      "editor.inlayHints.maximumLength" = 0;

      "git.autofetch" = true;
      "git.autoStash" = true;
      "git.confirmSync" = false;

      "diffEditor.ignoreTrimWhitespace" = true;

      "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font Mono', Menlo, Monaco, 'Courier New', monospace";

      "nix.enableLanguageServer" = true;

      "[rust]" = {
        "editor.formatOnSave" = true;
        "editor.defaultFormatter" = "rust-lang.rust-analyzer";
      };
      "rust-analyzer.imports.group.enable" = true;
      "rust-analyzer.checkOnSave" = true;
      "rust-analyzer.check.command" = "clippy";
      "rust-analyzer.inlayHints.closingBraceHints.enable" = false;

      "go.inlayHints.assignVariableTypes" = true;
      "go.inlayHints.compositeLiteralFields" = true;
      "go.inlayHints.parameterNames" = true;
      "go.inlayHints.rangeVariableTypes" = true;
      "go.inlayHints.constantValues" = true;
      "go.lintTool" = "golangci-lint";
      "go.toolsManagement.autoUpdate" = true;

      "[proto3]" = {
        "editor.formatOnSave" = true;
        "editor.tabSize" = 2;
        "editor.rulers" = [80];
      };

      "[python]" = {
        "editor.rulers" = [100];
      };

      "chat.commandCenter.enabled" = false;
      "redhat.telemetry.enabled" = false;
    };
  };
}
