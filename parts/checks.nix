{
  perSystem = { pkgs, ... }: {
    checks.formatter-check = pkgs.stdenvNoCC.mkDerivation {
      name = "formatter-check";
      src = ../.;
      doCheck = true;
      dontBuild = true;
      nativeBuildInputs = with pkgs; [ nixfmt-classic statix deadnix ];
      checkPhase = ''
        nixfmt -c .
        statix check --format errfmt
        deadnix -f
      '';

      installPhase = ''touch "$out"'';
    };
  };
}
