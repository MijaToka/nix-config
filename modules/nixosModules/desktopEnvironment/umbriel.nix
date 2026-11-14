{
  moduleWithSystem,
  inputs,
  self,
  ...
}:
{
  flake.nixosModules.umbriel = moduleWithSystem (
    _: _: {
      imports = [ inputs.umbriel.nixosModules.default ];
      programs.umbriel = {
        enable = true;
        # package = inputs'.umbriel.packages.default.override { inherit (pkgs) xwayland-satellite; };
      };
      nixpkgs.overlays = [ self.overlays.xwayland-satellite-fix ];
    }
  );
}
