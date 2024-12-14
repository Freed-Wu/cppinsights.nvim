{ pkgs ? import <nixpkgs> { } }:

with pkgs;
mkShell {
  name = "cppinsights.nvim";
  buildInputs = [
    stdenv.cc
    pkg-config
    cmake
    ninja

    llvm.dev

    libclang.dev

    (luajit.withPackages (
      p: with p; [
        busted
        ldoc
      ]
    ))
  ];
  shellHook = ''
    export CMAKE_GENERATOR=Ninja
  '';
}
