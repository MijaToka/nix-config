{
  self,
  inputs,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.nixSettings = moduleWithSystem (
    { inputs', ... }: {
      imports = [ inputs.nix-index-database.nixosModules.default ];
      config = {
        nix = {
          settings = {
            experimental-features = [
              "nix-command"
              "flakes"
            ];
          };
        };
        nixpkgs = {
          config.allowUnfree = true;
          overlays = [
            self.overlays.unstable-channel
          ];
        };
        environment.systemPackages = with inputs'; [
          nix-search-cli.packages.default
        ];
        programs.nix-index-database.comma.enable = true; # Run applications in nixpkgs cache without installing
      };
    }
  );
}
