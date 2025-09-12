{
  config.flake.homeModules.fish = { pkgs, ... }: {
    programs.fish = {
      enable = true;
      shellAliases = {
        ls = "${pkgs.eza}/bin/eza -l";

        # Git commands
        ga = "git add .";
        gc = "git commit -m";
        gp = "git push";
        gs = "git status";
      };

      interactiveShellInit = ''
        set fish_greeting

        function .
          nix shell nixpkgs#$argv[1]
        end

        function fish_command_not_found
          echo Did not find command: $argv[1]
        end
      '';
    };
  };
}
