{ inputs, moduleWithSystem, ... }: {
  flake.nixosModules.mpv = moduleWithSystem (
    { self', ... }: { pkgs, ... }: {
      nixpkgs.overlays = [ (_: _: { mvp = self'.packages.mpv; }) ];
      environment.systemPackages = [ pkgs.mvp ];
    }
  );
  perSystem = { pkgs, ... }: {
    packages.mpv = inputs.wrapper-modules.wrappers.mpv.wrap {
      inherit pkgs;
      "mpv.conf".content = ''
        target-colorspace-hint-mode=source
      '';
    };
  };
}
