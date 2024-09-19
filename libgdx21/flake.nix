{
  description = "A Nix-flake-based Java development environment";
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.*.tar.gz";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      javaVersion = 21; # Change this value to update the whole stack

      pkgs = import nixpkgs { inherit system; };

      javaPackage = pkgs."zulu${toString javaVersion}";
    in
    {
      devShells.default = pkgs.mkShell {
        packages = [
          javaPackage
        ];
        LD_LIBRARY_PATH = "${pkgs.libGL}/lib";
      };
    });
}
