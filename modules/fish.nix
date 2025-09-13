{
  config.flake.nixosModules.fish = { currentUser, pkgs, ... }: {
    users.users.${currentUser}.shell = pkgs.fish;
    programs.fish = {
      enable = true;
      shellAliases = { ls = "${pkgs.eza}/bin/eza -l"; };
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
