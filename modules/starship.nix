{
  config.flake.nixosModules.starship = _: {
    programs.starship = {
      enable = true;
      settings = {
        add_newline = false;
        directory.disabled = false;
        character = {
          disabled = false;
          success_symbol = "[λ](bold purple)";
          error_symbol = "[λ](bold red)";
        };
      };
    };
  };
}
