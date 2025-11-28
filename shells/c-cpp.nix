{ pkgs, ... }:

pkgs.mkShell {
  name = "c-cpp-dev-shell";
  packages = with pkgs; [
    gcc
    gdb
    cmake
    pkg-config
    ninja
    llvmPackages.llvm
    llvmPackages.clang-tools
  ];
}
