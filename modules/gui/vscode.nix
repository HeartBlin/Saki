{
  flake.nixosModules.vscode = { currentUser, pkgs, ... }:
    let
      languageServers = with pkgs.vscode-extensions; [ jnoortheen.nix-ide ];

      gitHubExtensions = with pkgs.vscode-extensions; [
        github.copilot
        github.codespaces
        github.vscode-github-actions
        github.vscode-pull-request-github
      ];

      uiExtensions = with pkgs.vscode-extensions; [
        pkief.material-icon-theme
        usernamehw.errorlens
      ];

      manualExtensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [{
        name = "copilot-chat";
        publisher = "GitHub";
        version = "0.31.1";
        sha256 = "sha256-1QVCfEr9Ws193mOpnJp2Y7PNnTaO2TR2fp3gNdtEVLM=";
      }];

      vscodeExtended = pkgs.vscode-with-extensions.override {
        inherit (pkgs) vscode;
        vscodeExtensions = languageServers ++ gitHubExtensions ++ uiExtensions
          ++ manualExtensions;
      };

      editorSettings = {
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
      };

      explorerSettings = {
        "explorer.compactFolders" = false;
        "explorer.confirmDelete" = false;
        "explorer.confirmDragAndDrop" = false;
      };

      filesSettings = {
        "files.autoSave" = "onWindowChange";
        "files.insertFinalNewline" = true;
        "files.trimTrailingWhitespace" = true;
      };

      nixSettings = {
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nil";
        "nix.serverSettings"."nil"."formatting"."command" = [ "nixfmt" ];

        "[nix]" = {
          "editor.defaultFormatter" = "jnoortheen.nix-ide";
          "editor.formatOnSave" = true;
        };
      };

      telemetrySettings = {
        "redhat.telemetry.enabled" = false;
        "telemetry.telemetryLevel" = "off";
        "extensions.autoCheckUpdates" = false;
        "extensions.autoUpdate" = false;
        "update.mode" = "none";
        "update.showReleaseNotes" = false;
      };

      windowSettings = {
        "window.dialogStyle" = "custom";
        "window.menuBarVisibility" = "toggle";
        "window.titleBarStyle" = "custom";
      };

      workbenchSettings = {
        "workbench.colorTheme" = "Default Dark+";
        "workbench.editor.empty.hint" = "hidden";
        "workbench.iconTheme" = "material-icon-theme";
        "workbench.layoutControl.enabled" = false;
        "workbench.startupEditor" = "none";
      };

      terminalSettings = {
        "terminal.integrated.fontFamily" = "'monospace'";
        "terminal.integrated.gpuAcceleration" = "on";
      };

      allSettings = editorSettings // explorerSettings // filesSettings
        // nixSettings // telemetrySettings // windowSettings
        // workbenchSettings // terminalSettings;

      settingsJSON = builtins.toJSON allSettings;
    in {
      users.users."${currentUser}".packages = with pkgs; [
        vscodeExtended
        nil
        nixfmt-classic
        statix
        deadnix
      ];

      hjem.users."${currentUser}".files.".config/Code/User/settings.json".text =
        settingsJSON;
    };
}
