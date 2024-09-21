{ pkgs ? import <nixpkgs> { } }:

with pkgs;
mkShell {
  name = "cppinsights.nvim";
  buildInputs = [
    cmake
    ninja
    llvm.dev
    libclang.dev
    pkg-config
    luajit
    stdenv.cc
  ];
}
