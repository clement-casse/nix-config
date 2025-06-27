{ pkgs, lib, system, nix-vscode-extensions, ... }:
let
  vscodeExtensions = nix-vscode-extensions.extensions."${system}".vscode-marketplace;

  # THEMES: install some themes
  themes = with vscodeExtensions; [
    # Light themes
    teabyii.ayu

    # Dark themes
    arcticicestudio.nord-visual-studio-code
    marlosirapuan.nord-deep
    pmndrs.pmndrs
  ];

  # SHARED EXTENSIONS: a common base of extensions used in all profiles
  shared.extensions = with vscodeExtensions; [
    mkhl.direnv
    bbenoist.nix
    jnoortheen.nix-ide
    arrterian.nix-env-selector
    editorconfig.editorconfig

    arturock.gitstash
    waderyan.gitblame

    ms-vscode.live-server
    ms-azuretools.vscode-containers
  ];

  interfaceCustomization = {
    "window.autoDetectColorScheme" = true;
    "workbench.preferredDarkColorTheme" = "Nord";
    "workbench.preferredLightColorTheme" = "Ayu Light Bordered";

    "editor.fontFamily" = "'Monaspace Neon Frozen', Menlo, Monaco, 'Courier New', monospace";
    "editor.fontSize" = 14;
    "editor.fontVariations" = "'wght' 350";
    "editor.lineHeight" = 1.7;
    "editor.fontLigatures" = "'calt', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'ss09', 'liga'";
    "editor.inlayHints.fontFamily" = "'Monaspace Radon Frozen', Menlo, Monaco, 'Courier New', monospace";
    "editor.inlayHints.fontSize" = 10;
    "terminal.integrated.fontFamily" = "'Monaspace Krypton Frozen', Menlo, Monaco, 'Courier New', monospace";
    "terminal.integrated.fontSize" = 12;
    "terminal.integrated.fontWeight" = 500;
	  "terminal.integrated.fontWeightBold" = 800;
  };

  # SHARED USER SETTINGS: a common base of all user settings that are used in all profiles
  shared.userSettings = {
    "workbench.tips.enabled" = false;
    "extensions.ignoreRecommendations" = true;
    "chat.commandCenter.enabled" = false;

    "editor.renderControlCharacters" = true;
    "editor.renderWhitespace" = "boundary";
    "editor.guides.bracketPairs" = true;
    "editor.inlayHints.padding" = true;
    "editor.inlayHints.maximumLength" = 0;
    "editor.hover.delay" = 1000;

    "git.autofetch" = true;
    "git.autoStash" = true;
    "git.confirmSync" = false;

    "gitblame.inlineMessageEnabled" = true;
    "gitblame.inlineMessageFormat" = "\${author.name} (\${time.ago})";
    "gitblame.delayBlame" = 600;

    "diffEditor.ignoreTrimWhitespace" = true;

    "nix.enableLanguageServer" = true;
    "nixEnvSelector.useFlakes" = true;
  };

  # EXTENSIONS & USER SETTINGS for protobuf development.
  protobuf = {
    extensions = with vscodeExtensions; [
      zxh404.vscode-proto3
      bufbuild.vscode-buf
    ];
    userSettings = {
      "[proto3]" = {
        "editor.formatOnSave" = true;
        "editor.tabSize" = 2;
        "editor.rulers" = [ 80 ];
      };
    };
  };

  # EXTENSIONS & USER SETTINGS for kubernetes development.
  kubernetes = {
    extensions = with vscodeExtensions; [
      redhat.vscode-yaml
      ms-kubernetes-tools.vscode-kubernetes-tools
    ];
    userSettings = {
      "vs-kubernetes" = {
        "vs-kubernetes.crd-code-completion" = "disabled";
      };

      "redhat.telemetry.enabled" = false;
    };
  };

  work = {
    extensions = with vscodeExtensions; [
      gitlab.gitlab-workflow
    ];
    userSettings = {
    };
  };
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    profiles.default = {
      enableExtensionUpdateCheck = true;
      enableUpdateCheck = true;

      extensions = themes ++ shared.extensions ++ protobuf.extensions ++ kubernetes.extensions ++ work.extensions;
      userSettings = lib.mkMerge [
        shared.userSettings
        interfaceCustomization
        protobuf.userSettings
        kubernetes.userSettings
      ];
    };

    profiles.Rust = {
      extensions = with vscodeExtensions; themes ++ shared.extensions ++ protobuf.extensions ++ [
        tamasfe.even-better-toml
        rust-lang.rust-analyzer
        # vadimcn.vscode-lldb
        ryanluker.vscode-coverage-gutters
        masterustacean.cargo-runner
      ];

      userSettings = lib.mkMerge [
        shared.userSettings
        interfaceCustomization
        protobuf.userSettings
        {
          "[rust]" = {
            "editor.formatOnSave" = true;
            "editor.defaultFormatter" = "rust-lang.rust-analyzer";
            "editor.codeActionsOnSave" = {
              "source.organizeImports" = "explicit";
            };
          };
          "rust-analyzer.imports.group.enable" = true;
          "rust-analyzer.checkOnSave" = true;
          "rust-analyzer.check.command" = "clippy";
          "rust-analyzer.inlayHints.closingBraceHints.enable" = false;
          "rust-analyzer.testExplorer" = true;
          "rust-analyzer.interpret.tests" = true;
          "rust-analyzer.cargo.targetDir" = true;
          "rust-analyzer.procMacro.enable" = true;

          "debug.allowBreakpointsEverywhere" = true;
          "lldb.suppressUpdateNotifications" = true;
        }
      ];
    };

    profiles.Go = {
      extensions = with vscodeExtensions; themes ++ shared.extensions ++ protobuf.extensions ++ kubernetes.extensions ++ [
        golang.go
      ];

      userSettings = lib.mkMerge [
        shared.userSettings
        interfaceCustomization
        protobuf.userSettings
        {
          "go.inlayHints.assignVariableTypes" = true;
          "go.inlayHints.compositeLiteralFields" = true;
          "go.inlayHints.parameterNames" = true;
          "go.inlayHints.rangeVariableTypes" = true;
          "go.inlayHints.constantValues" = true;
          "go.lintTool" = "golangci-lint";
          "go.toolsManagement.autoUpdate" = true;
        }
      ];
    };

    profiles.Python = {
      extensions = with vscodeExtensions; themes ++ shared.extensions ++ [
        donjayamanne.python-extension-pack
        tamasfe.even-better-toml
        ms-toolsai.jupyter
        charliermarsh.ruff
      ];

      userSettings = lib.mkMerge [
        shared.userSettings
        interfaceCustomization
        {
          "[python]" = {
            "editor.rulers" = [ 100 ];
          };
          "python.analysis.autoImportCompletions" = true;
          "python.analysis.fixAll" = [ "source.unusedImports" ];
          "editor.defaultFormatter" = "charliermarsh.ruff";
        }
      ];
    };
  };
}
