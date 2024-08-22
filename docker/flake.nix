{
  description = "A Nix-flake-based Docker development environment";
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.*.tar.gz";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          docker
          docker-compose
        ];

        shellHook = ''
          echo "Starting Docker daemon..."
          sudo systemctl start docker
          trap 'echo "Stopping Docker daemon..."; sudo systemctl stop docker' EXIT
        '';
      };
    });
}
