{
  config.flake.homeModules.vscode = { pkgs, ... }: {
    programs.vscode = {
      enable = true;

      profiles.default = {
        extensions = with pkgs.vscode-extensions; [
          # Language support
          jnoortheen.nix-ide # Nix language support

          # GIT tools
          github.copilot # GitHub Copilot
          github.copilot-chat # GitHub Copilot Chat
          github.codespaces # GitHub Codespaces
          github.vscode-github-actions # GitHub Actions
          github.vscode-pull-request-github # GitHub Pull Requests

          # UI/UX
          pkief.material-icon-theme # Icon theme
          usernamehw.errorlens # Error highlighting
        ];

        userSettings = {
          "editor.bracketPairColorization.enabled" = true;
          "editor.cursorBlinking" = "smooth";
          "editor.cursorSmoothCaretAnimation" = "on";
          "editor.fontFamily" = "'Cascadia Code', 'monospace'";
          "editor.fontLigatures" = true;
          "editor.letterSpacing" = 0.5;
          "editor.lineHeight" = 22;
          "editor.minimap.enabled" = false;
          "editor.scrollball.horizontal" = "hidden";
          "editor.smoothScrolling" = true;
          "editor.stickyScroll.enabled" = true;
          "editor.trimAutoWhitespace" = true;
          "editor.wordWrap" = "on";

          "explorer.compactFolders" = false;
          "explorer.confirmDelete" = false;
          "explorer.confirmDragAndDrop" = false;

          "files.autoSave" = "onWindowChange";
          "files.insertFinalNewline" = true;
          "files.trimTrailingWhitespace" = true;

          "extensions.autoCheckUpdates" = false;
          "extensions.autoUpdate" = false;
          "redhat.telemetry.enabled" = false;
          "telemetry.telemetryLevel" = "off";
          "update.mode" = "none";
          "update.showReleaseNotes" = false;

          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "nil";

          "terminal.integrated.fontFamily" = "'monospace'";
          "terminal.integrated.gpuAcceleration" = "on";

          "window.dialogStyle" = "custom";
          "window.menuBarVisibility" = "toggle";
          "window.titleBarStyle" = "custom";

          "workbench.colorTheme" = "Default Dark+";
          "workbench.editor.empty.hint" = "hidden";
          "workbench.iconTheme" = "material-icon-theme";
          "workbench.layoutControl.enabled" = false;
          "workbench.startupEditor" = "none";
        };
      };
    };

    home.packages = with pkgs; [ nil nixfmt-classic statix ];
  };
}
