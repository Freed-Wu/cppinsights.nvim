{
  pkgs ? import <nixpkgs> { },
}:

with pkgs;
mkShell {
  name = "cppinsights.nvim";
  buildInputs = [
    pkg-config
    cmake
    ninja
    xmake

    llvmPackages_latest.llvm
    llvmPackages_latest.libclang

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
