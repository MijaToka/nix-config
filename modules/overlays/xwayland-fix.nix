{ inputs, ... }: {
  flake.overlays.xwayland-satellite-fix =
    final: _:
    let
      pkgs-fix = import inputs.nixpkgs-xwayland-fix {
        inherit (final.stdenv.hostPlatform) system;
      };
    in
    {
      inherit (pkgs-fix) xwayland-satellite;
    };
}
