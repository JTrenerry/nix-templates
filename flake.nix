{
  description = "A collection of nix-templates";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    utils.url ="github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }: {
    nixosModules = {
      default = {config, pkgs, lib, ...}: {
        nix.registry.devtemplates = {
          to = {
            owner = "JTrenerry";
            repo = "nix-templates";
            type = "github";
          };
          from = {
            id = "devtemplates";
            type = "indirect";
          };
        };
      };
    };
    templates = {
      default = {
        path = ./default;
        description = "Default";
        welcomeText = ''
        # A empty, default template
        ...to modify to your hearts content
        '';
      };
      c = {
        path = ./c;
        description = "C";
        welcomeText = ''
        # A simple C template
        Provides GCC and clang
        '';
      };
      java21 = {
        path = ./java21;
        description = "Java21";
        welcomeText = ''
        # A simple Java21 template
        Provides Java21 stuff
        '';
      };
      java17 = {
        path = ./java17;
        description = "Java17";
        welcomeText = ''
        # A simple Java17 template
        Provides Java17 stuff
        '';
      };
      docker = {
        path = ./docker;
        description = "Docker";
        welcomeText = ''
        # A simple docker template
        Downloads Docker and docker-compose
        Starts / Stop the daemon
        '';
      };
    };
  };
}
