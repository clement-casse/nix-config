{ pkgs, system, nix-vscode-extensions, ... }:
let
  vscodeExtensions = nix-vscode-extensions.extensions."${system}".vscode-marketplace;
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    mutableExtensionsDir = false; # Allow to install extensions by hand and not rerun nix-switch
    extensions = with vscodeExtensions; [
      # Extensions
      mkhl.direnv
      bbenoist.nix
      jnoortheen.nix-ide
      arrterian.nix-env-selector
      editorconfig.editorconfig
      redhat.vscode-yaml
      ms-kubernetes-tools.vscode-kubernetes-tools
      tamasfe.even-better-toml
      rust-lang.rust-analyzer
      vadimcn.vscode-lldb
      ms-vscode.live-server
      ryanluker.vscode-coverage-gutters
      zxh404.vscode-proto3
      thenuprojectcontributors.vscode-nushell-lang
      golang.go

      # Themes
      teabyii.ayu
      arcticicestudio.nord-visual-studio-code
    ];

    userSettings = {
      "window.autoDetectColorScheme" = true;
      "workbench.preferredDarkColorTheme" = "Nord";
      "workbench.preferredLightColorTheme" = "Ayu Light";

      "workbench.tips.enabled" = false;
      "extensions.ignoreRecommendations" = true;
      "lldb.suppressUpdateNotifications" = true;

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
      "rust-analyzer.testExplorer" = true;
      "rust-analyzer.interpret.tests" = true;
      "rust-analyzer.cargo.targetDir" = true;

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
        "editor.rulers" = [ 80 ];
      };

      "[python]" = {
        "editor.rulers" = [ 100 ];
      };

      "chat.commandCenter.enabled" = false;
      "redhat.telemetry.enabled" = false;
    };
  };
}
