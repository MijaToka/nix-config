inputs:
let
  system = "x86_64-linux";
in
inputs.flake-parts.lib.mkFlake { inherit inputs; } (_: {

  imports = [ (inputs.import-tree ./modules) ];

  flake = {
    nixosConfigurations = {
      nixos = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        # inherit system;
        modules = [
          ./nixos/configuration.nix
          {
            nixpkgs = {
              hostPlatform = { inherit system; };
              overlays = [
                (final: _: {
                  unstable = import inputs.nixpkgs-unstable {
                    inherit (final) config;
                    inherit (final.stdenv.hostPlatform) system;
                  };
                })
              ];
            };
            environment.systemPackages = with inputs; [
              my-nvf-config.packages.${system}.default
              nix-search-cli.packages.${system}.default
            ];
          }
          inputs.nix-index-database.nixosModules.default
        ];
      };
    };

    homeConfigurations = {
      mija = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        modules = [
          ./Mija/home.nix
          inputs.stylix.homeManagerModules.stylix
        ];
      };
    };
  };
})
