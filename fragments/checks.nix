{ inputs, ... }:

{
  imports = [ inputs.pre-commit-hooks.flakeModule ];

  perSystem = { config, pkgs, ... }:
  let inherit (pkgs) mkShellNoCC;
    in{
    formatter = with pkgs; nixfmt-classic;

    devShells.default = mkShellNoCC {
        name = "Nix";
        buildInputs = config.pre-commit.settings.enabledPackages;
        shellHook = config.pre-commit.installationScript;
      };

    pre-commit = {
      settings = {
      hooks = {
        deadnix = {
          enable = true;
          verbose = true;
          fail_fast = true;
          # settings.noLambdaPatternNames = true;
        };

        nixfmt-classic = {
          enable = true;
          verbose = true;
          fail_fast = true;
        };

        statix = {
          enable = true;
          verbose = true;
          fail_fast = true;
        };
      };
    };
    };
  };
}
