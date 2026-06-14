{
  nixpkgs,
  home-manager,
  stylix,
  ...
}@inputs:
let
  system = "x86_64-linux";
in
{
  nixosConfigurations = {
    nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      # inherit system;
      modules = [
        ./nixos/configuration.nix
        {
          nixpkgs = {
            hostPlatform.system = "${system}";
            overlays = [
              (final: prev: {
                unstable = import inputs.nixpkgs-unstable {
                  inherit (final) config;
                  inherit (final.stdenv.hostPlatform) system;
                };
              })
            ];
          };
          environment.systemPackages = [ inputs.my-nvf-config.packages.${system}.default ];
        }
        inputs.nix-index-database.nixosModules.default
      ];
    };
  };

  homeConfigurations = {
    mija = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [
        ./Mija/home.nix
        stylix.homeManagerModules.stylix
      ];
    };
  };
}
