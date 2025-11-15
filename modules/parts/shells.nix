{
  perSystem = { pkgs, ... }: {
    devShells.c = pkgs.mkShell {
      packages = with pkgs; [
        gcc
        gdb
        cmake
        pkg-config
        ninja
        llvmPackages.llvm
        llvmPackages.clang-tools
      ];
    };
  };
}
