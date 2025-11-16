{
  perSystem = { inputs', pkgs, ... }: {
    packages = {
      SakiShell = pkgs.stdenv.mkDerivation {
        name = "SakiShell";
        pname = "SakiShell";
        src = ./ags;

        nativeBuildInputs = with pkgs; [
          wrapGAppsHook3
          gobject-introspection
          inputs'.ags.packages.default
        ];

        buildInputs = [
          pkgs.glib
          pkgs.gjs
          inputs'.astal.packages.io
          inputs'.astal.packages.astal4
        ];

        installPhase = ''
          mkdir -p $out/bin
          ags bundle app.ts $out/bin/SakiShell
        '';

        # preFixup = ''
        #   gappsWrapperArgs+=(
        #     --prefix PATH : ${pkgs.lib.makeBinPath ([ ])}
        #   )
        # '';
      };
    };
  };
}
