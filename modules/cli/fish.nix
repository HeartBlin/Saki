{
  flake.nixosModules.fish = { currentUser, pkgs, ... }: {
    users.users.${currentUser}.shell = pkgs.fish;
    programs.fish = {
      enable = true;
      shellAliases = {
        ls = "${pkgs.eza}/bin/eza -l";
        makeNix =
          "nixos-rebuild switch --flake ~/Documents/Saki/.# --sudo --log-format bar-with-logs";
        makeNixBoot =
          "nixos-rebuild boot --flake ~/Documents/Saki/.# --sudo --log-format bar-with-logs";
        makeNixClean = "sudo nix-collect-garbage -d --log-format bar-with-logs";
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
