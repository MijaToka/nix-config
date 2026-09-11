{ inputs, ... }: {
  flake.nixosModules.umbriel =
    # { self', ... }: _:
    {
      imports = [ inputs.umbriel.nixosModules.default ];
      programs.umbriel = {
        enable = true;
        # package = self'.packages.umbriel;
      };
    };
}
