{ pkgs, ... }:

{
  c-cpp = import ./c-cpp.nix { inherit pkgs; };
}
