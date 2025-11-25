{ config, lib, pkgs, ... }:

let ctx = config.aster;
in {
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

  programs.starship = {
    enable = true;
    settings = {
      format = "$directory$git_branch$git_status$character";
      add_newline = false;
      directory.disabled = false;
      character = {
        disabled = false;
        success_symbol = "[λ](bold purple)";
        error_symbol = "[λ](bold red)";
      };
    };
  };

  users.users = lib.genAttrs ctx.users (userName: { shell = pkgs.fish; });
}
