{ pkgs, inputs, lib, system, ... }:
let
  vscodeExtensions = (import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
    overlays = [
      inputs.nix-vscode-extensions.overlays.default
    ];
  }).vscode-marketplace;

  vscodeExtensionsFrozen = (import inputs.nixpkgs-frozen {
    inherit system;
    overlays = [
      inputs.nix-vscode-extensions-frozen.overlays.default
    ];
  }).vscode-marketplace;

  # THEMES: install some themes
  themes = with vscodeExtensions; [
    # Light themes
    teabyii.ayu

    # Dark themes
    arcticicestudio.nord-visual-studio-code
    github.github-vscode-theme
    akamud.vscode-theme-onedark
    yummygum.city-lights-theme

    # Icon themes
    keenethics.keen-neutral-icon-theme
    yummygum.city-lights-icon-vsc
  ];

  shared = {
    # SHARED EXTENSIONS: a common base of extensions used in all profiles
    extensions = with vscodeExtensions; [
      mkhl.direnv
      bbenoist.nix
      jnoortheen.nix-ide
      arrterian.nix-env-selector
      editorconfig.editorconfig
      visualjj.visualjj

      ms-vscode.live-server
      ms-azuretools.vscode-containers
      neo4j-extensions.neo4j-for-vscode
      bierner.markdown-mermaid
    ];

    # SHARED USER SETTINGS: a common base of all user settings that are used in all profiles
    userSettings = {
      "workbench.tips.enabled" = false;
      "extensions.ignoreRecommendations" = true;
      "chat.commandCenter.enabled" = false;
      "update.showReleaseNotes" = false;
      "explorer.confirmDragAndDrop" = false;

      "editor.renderControlCharacters" = true;
      "editor.renderWhitespace" = "boundary";
      "editor.guides.bracketPairs" = true;
      "editor.inlayHints.padding" = true;
      "editor.inlayHints.maximumLength" = 0;
      "editor.hover.delay" = 1000;

      "git.autofetch" = true;
      "git.autoStash" = true;
      "git.confirmSync" = false;

      "diffEditor.ignoreTrimWhitespace" = true;

      "nix.enableLanguageServer" = true;
      "nixEnvSelector.useFlakes" = true;
    };
  };

  interfaceCustomization = {
    "window.autoDetectColorScheme" = lib.mkDefault true;
    "workbench.preferredDarkColorTheme" = lib.mkDefault "Ayu Mirage Bordered";
    "workbench.preferredLightColorTheme" = lib.mkDefault "Ayu Light Bordered";
    "workbench.iconTheme" = lib.mkDefault "ayu";

    "editor.fontFamily" = "'Monaspace Neon Frozen', Menlo, Monaco, 'Courier New', monospace";
    "editor.fontSize" = 14;
    "editor.fontVariations" = "'wght' 350";
    "editor.lineHeight" = 1.7;
    "editor.fontLigatures" = "'calt', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'ss09', 'liga'";
    "editor.inlayHints.fontFamily" = "'Monaspace Radon Frozen', Menlo, Monaco, 'Courier New', monospace";
    "editor.inlayHints.fontSize" = 10;
    "editor.lineNumbers" = "relative";

    "terminal.integrated.fontFamily" = "'Monaspace Krypton Frozen', Menlo, Monaco, 'Courier New', monospace";
    "terminal.integrated.fontSize" = 12;
    "terminal.integrated.fontLigatures" = "'calt', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'ss09', 'liga'";
    "terminal.integrated.fontWeight" = 500;
    "terminal.integrated.fontWeightBold" = 800;

    "files.exclude" = {
      "**/.direnv/" = true;
      "**/.jj/" = true;
    };
    "explorer.sortOrder" = "type";
    "workbench.tree.indent" = 12;
    # Shamelessly stolen from https://github.com/antfu/vscode-file-nesting-config
    "explorer.fileNesting.enabled" = true;
    "explorer.fileNesting.expand" = false;
    "explorer.fileNesting.patterns" = {
      ".gitignore" = ".gitattributes, .gitmodules, .gitmessage, .lfsconfig, .mailmap, .git-blame*";
      "flake.nix" = "flake.lock, .envrc";
      "Dockerfile" = "*.dockerfile, .devcontainer.*, .dockerignore, captain-definition, compose.*, docker-compose.*, dockerfile*";
      "readme*" = "AUTHORS, Authors, BACKERS*, Backers*, CHANGELOG*, CITATION*, CODEOWNERS, CODE_OF_CONDUCT*, CONTRIBUTING*, CONTRIBUTORS, COPYING*, CREDITS, Changelog*, Citation*, Code_Of_Conduct*, Codeowners, Contributing*, Contributors, Copying*, Credits, GOVERNANCE.MD, Governance.md, HISTORY.MD, History.md, LICENSE*, License*, MAINTAINERS, Maintainers, README-*, README_*, RELEASE_NOTES*, ROADMAP.MD, Readme-*, Readme_*, Release_Notes*, Roadmap.md, SECURITY.MD, SPONSORS*, Security.md, Sponsors*, authors, backers*, changelog*, citation*, code_of_conduct*, codeowners, contributing*, contributors, copying*, credits, governance.md, history.md, license*, maintainers, readme-*, readme_*, release_notes*, roadmap.md, security.md, sponsors*";
      "Readme*" = "AUTHORS, Authors, BACKERS*, Backers*, CHANGELOG*, CITATION*, CODEOWNERS, CODE_OF_CONDUCT*, CONTRIBUTING*, CONTRIBUTORS, COPYING*, CREDITS, Changelog*, Citation*, Code_Of_Conduct*, Codeowners, Contributing*, Contributors, Copying*, Credits, GOVERNANCE.MD, Governance.md, HISTORY.MD, History.md, LICENSE*, License*, MAINTAINERS, Maintainers, README-*, README_*, RELEASE_NOTES*, ROADMAP.MD, Readme-*, Readme_*, Release_Notes*, Roadmap.md, SECURITY.MD, SPONSORS*, Security.md, Sponsors*, authors, backers*, changelog*, citation*, code_of_conduct*, codeowners, contributing*, contributors, copying*, credits, governance.md, history.md, license*, maintainers, readme-*, readme_*, release_notes*, roadmap.md, security.md, sponsors*";
      "README*" = "AUTHORS, Authors, BACKERS*, Backers*, CHANGELOG*, CITATION*, CODEOWNERS, CODE_OF_CONDUCT*, CONTRIBUTING*, CONTRIBUTORS, COPYING*, CREDITS, Changelog*, Citation*, Code_Of_Conduct*, Codeowners, Contributing*, Contributors, Copying*, Credits, GOVERNANCE.MD, Governance.md, HISTORY.MD, History.md, LICENSE*, License*, MAINTAINERS, Maintainers, README-*, README_*, RELEASE_NOTES*, ROADMAP.MD, Readme-*, Readme_*, Release_Notes*, Roadmap.md, SECURITY.MD, SPONSORS*, Security.md, Sponsors*, authors, backers*, changelog*, citation*, code_of_conduct*, codeowners, contributing*, contributors, copying*, credits, governance.md, history.md, license*, maintainers, readme-*, readme_*, release_notes*, roadmap.md, security.md, sponsors*";

      # Go Stuff
      "go.mod" = ".air*, go.sum";
      "go.work" = "go.work.sum";
      "*.go" = "$(capture)_test.go";
      "Makefile" = "*.mk";

      # Rust Stuff
      "Cargo.toml" = ".clippy.toml, .rustfmt.toml, Cargo.Bazel.lock, Cargo.lock, clippy.toml, cross.toml, insta.yaml, rust-toolchain.toml, rustfmt.toml, taplo.toml";

      # Python
      "pyproject.toml" = ".commitlint*, .cspell*, .dlint.json, .dprint.json*, .editorconfig, .eslint*, .flake8, .flowconfig, .isort.cfg, .jslint*, .lintstagedrc*, .ls-lint.yml, .markdownlint*, .oxlintrc.json, .oxlintrc.json.bak, .pdm-python, .pdm.toml, .prettier*, .pylintrc, .python-version, .ruff.toml, .shellcheckrc, .stylelint*, .textlint*, .xo-config*, .yamllint*, MANIFEST.in, Pipfile, Pipfile.lock, biome.json*, commitlint*, cspell*, dangerfile*, dlint.json, dprint.json*, eslint*, hatch.toml, lint-staged*, pdm.lock, phpcs.xml, poetry.lock, poetry.toml, prettier*, pyproject.toml, pyrightconfig.json, requirements*.in, requirements*.pip, requirements*.txt, ruff.toml, setup.cfg, setup.py, stylelint*, tox.ini, tslint*, uv.lock, uv.toml, xo.config.*";
      "requirements.txt" = ".editorconfig, .flake8, .isort.cfg, .python-version, requirements*.in, requirements*.pip, requirements*.txt, tox.ini";
      "setup.cfg" = ".editorconfig, .flake8, .isort.cfg, .python-version, MANIFEST.in, requirements*.in, requirements*.pip, requirements*.txt, setup.cfg, tox.ini";
      "setup.py" = ".editorconfig, .flake8, .isort.cfg, .python-version, MANIFEST.in, requirements*.in, requirements*.pip, requirements*.txt, setup.cfg, setup.py, tox.ini";
      "*.py" = "$(capture).pyi";

      # TypeScript / Javascript
      "package.json" = "*.code-workspace, .browserslist*, .circleci*, .commitlint*, .cspell*, .cursor*, .cz-config.js, .czrc, .dlint.json, .dprint.json*, .editorconfig, .eslint*, .firebase*, .flowconfig, .github*, .gitlab*, .gitmojirc.json, .gitpod*, .huskyrc*, .jslint*, .knip.*, .lintstagedrc*, .ls-lint.yml, .markdownlint*, .node-version, .nodemon*, .npm*, .nvmrc, .oxlintrc.json, .oxlintrc.json.bak, .pm2*, .pnp.*, .pnpm*, .prettier*, .pylintrc, .release-please*.json, .releaserc*, .ruff.toml, .sentry*, .shellcheckrc, .simple-git-hooks*, .stackblitz*, .styleci*, .stylelint*, .tazerc*, .textlint*, .tool-versions, .travis*, .versionrc*, .vscode*, .watchman*, .windsurfrules, .xo-config*, .yamllint*, .yarnrc*, Procfile, apollo.config.*, appveyor*, azure-pipelines*, biome.json*, bower.json, build.config.*, bun.lock, bun.lockb, bunfig.toml, colada.options.ts, commitlint*, crowdin*, cspell*, dangerfile*, dlint.json, dprint.json*, ec.config.*, electron-builder.*, eslint*, firebase.json, grunt*, gulp*, jenkins*, knip.*, lerna*, lint-staged*, nest-cli.*, netlify*, nixpacks*, nodemon*, npm-shrinkwrap.json, nx.*, package-lock.json, package.nls*.json, phpcs.xml, pm2.*, pnpm*, prettier*, pullapprove*, pyrightconfig.json, release-please*.json, release-tasks.sh, release.config.*, renovate*, rolldown.config.*, rollup.config.*, rspack*, ruff.toml, sentry.*.config.ts, simple-git-hooks*, sonar-project.properties, stylelint*, taze.config.*, tsdown.config.*, tslint*, tsup.config.*, turbo*, typedoc*, unlighthouse*, vercel*, vetur.config.*, webpack*, workspace.json, wrangler.*, xo.config.*, yarn*";
      "*.ts" = "$(capture).js, $(capture).d.ts.map, $(capture).*.ts, $(capture)_*.js, $(capture)_*.ts";
      "*.mts" = "$(capture).mts.map, $(capture).*.mts, $(capture)_*.mts";
      "*.module.ts" = "$(capture).resolver.ts, $(capture).controller.ts, $(capture).service.ts";
      "*.component.ts" = "$(capture).component.html, $(capture).component.spec.ts, $(capture).component.css, $(capture).component.scss, $(capture).component.sass, $(capture).component.less";
      "*.tsx" = "$(capture).ts, $(capture).*.tsx, $(capture)_*.ts, $(capture)_*.tsx, $(capture).css, $(capture).module.css, $(capture).less, $(capture).module.less, $(capture).module.less.d.ts, $(capture).scss, $(capture).module.scss, $(capture).module.scss.d.ts, $(capture).css.ts";
      "*.js" = "$(capture).js.map, $(capture).*.js, $(capture)_*.js, $(capture).d.ts, $(capture).d.ts.map, $(capture).js.flow";
      "*.mjs" = "$(capture).mjs.map, $(capture).*.mjs, $(capture)_*.mjs";
      "*.cjs" = "$(capture).cjs.map, $(capture).*.cjs, $(capture)_*.cjs";
      "*.jsx" = "$(capture).js, $(capture).*.jsx, $(capture)_*.js, $(capture)_*.jsx, $(capture).css, $(capture).module.css, $(capture).less, $(capture).module.less, $(capture).module.less.d.ts, $(capture).scss, $(capture).module.scss, $(capture).module.scss.d.ts";
      "*.vue" = "$(capture).*.ts, $(capture).*.js, $(capture).story.vue";
      "next.config.*" = "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, content.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, next-env.d.ts, next-i18next.config.*, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, react-router.config.*, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*";
      "nuxt.config.*" = "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .nuxtignore, .nuxtrc, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, content.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, react-router.config.*, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*";
      "svelte.config.*" = "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, content.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, houdini.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, mdsvex.config.js, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, react-router.config.*, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vite.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*";
      "vite.config.*" = "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, content.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, react-router.config.*, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*";
      "vue.config.*" = "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, capacitor.config.*, content.config.*, contentlayer.config.*, cssnano.config.*, cypress.*, env.d.ts, formkit.config.*, formulate.config.*, histoire.config.*, htmlnanorc.*, i18n.config.*, ionic.config.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, panda.config.*, playwright.config.*, postcss.config.*, puppeteer.config.*, react-router.config.*, rspack.config.*, sst.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, uno.config.*, unocss.config.*, vitest.config.*, vuetify.config.*, webpack.config.*, windi.config.*";
    };
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

  rust = {
    extensions = (with vscodeExtensions; [
      tamasfe.even-better-toml
      rust-lang.rust-analyzer
      ryanluker.vscode-coverage-gutters
      masterustacean.cargo-runner
      mitsuhiko.insta
    ]) ++ (with vscodeExtensionsFrozen; [
      vadimcn.vscode-lldb
    ]) ;
    userSettings = {
      "[rust]" = {
        "editor.formatOnSave" = true;
        "editor.rulers" = [ 80 100 ];
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
    };
  };

  typst = {
    extensions = with vscodeExtensions; [ myriad-dreamin.tinymist ];
    userSettings = {
      "[typst]" = {
        "editor.formatOnSave" = true;
      };
    };
  };

  go = {
    extensions = with vscodeExtensions; [ golang.go ];
    userSettings = {
      "go.inlayHints.assignVariableTypes" = true;
      "go.inlayHints.compositeLiteralFields" = true;
      "go.inlayHints.parameterNames" = true;
      "go.inlayHints.rangeVariableTypes" = true;
      "go.inlayHints.constantValues" = true;
      "go.lintTool" = "golangci-lint";
      "go.toolsManagement.autoUpdate" = true;
    };
  };

  python = {
    extensions = with vscodeExtensions; [
      donjayamanne.python-extension-pack
      tamasfe.even-better-toml
      ms-toolsai.jupyter
      charliermarsh.ruff
    ];
    userSettings = {
      "[python]" = {
        "editor.rulers" = [ 100 ];
        "editor.defaultFormatter" = "charliermarsh.ruff";
      };
      "python.analysis.autoImportCompletions" = true;
      "python.analysis.fixAll" = [ "source.unusedImports" ];
    };
  };

in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;

      extensions = themes
        ++ shared.extensions
        ++ protobuf.extensions
        ++ rust.extensions
        ++ typst.extensions
        ++ go.extensions
        ++ python.extensions;

      userSettings = lib.mkMerge [
        shared.userSettings
        interfaceCustomization
        protobuf.userSettings
        rust.userSettings
        typst.userSettings
        go.userSettings
        python.userSettings
      ];
    };
  };
}
