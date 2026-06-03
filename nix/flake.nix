{
  description = "User CLI environment managed by Nix Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      mkHome = { system, username, homeDirectory, modules ? [ ] }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };
          modules = [
            ./home/common.nix
            {
              home.username = username;
              home.homeDirectory = homeDirectory;
            }
          ] ++ modules;
        };
    in
    {
      homeConfigurations = {
        "sorahas-gram" = mkHome {
          system = "aarch64-darwin";
          username = "soraha";
          homeDirectory = "/Users/soraha";
          modules = [ ./home/darwin.nix ];
        };

        "soraha-darwin" = mkHome {
          system = "aarch64-darwin";
          username = "soraha";
          homeDirectory = "/Users/soraha";
          modules = [ ./home/darwin.nix ];
        };

        "soraha-linux" = mkHome {
          system = "x86_64-linux";
          username = "soraha";
          homeDirectory = "/home/soraha";
          modules = [ ./home/linux.nix ];
        };

        "yuni-linux" = mkHome {
          system = "x86_64-linux";
          username = "yuni";
          homeDirectory = "/home/yuni";
          modules = [ ./home/linux.nix ];
        };
      };
    };
}
