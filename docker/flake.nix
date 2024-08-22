{
  description = "A Nix-flake-based Java development environment";
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.*.tar.gz";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
    {
      devShells.default = nixpkgs.mkShell {
        packages = with nixpkgs; [
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
