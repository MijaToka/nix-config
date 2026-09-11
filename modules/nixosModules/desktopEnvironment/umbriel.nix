{
  moduleWithSystem,
  inputs,
  self,
  ...
}:
{
  flake.nixosModules.umbriel = moduleWithSystem (
    { inputs', ... }:
    { pkgs, ... }:
    {
      imports = [ inputs.umbriel.nixosModules.default ];
      programs.umbriel = {
        enable = true;
        package = inputs'.umbriel.packages.default.override { inherit (pkgs) xwayland-satellite; };
      };
      nixpkgs.overlays = [ self.overlays.xwayland-satellite-fix ];
    }
  );
}
