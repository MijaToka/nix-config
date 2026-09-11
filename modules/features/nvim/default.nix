{ moduleWithSystem, ... }: {
  flake.nixosModules.nvim = moduleWithSystem (
    { self', ... }: {
      environment.systemPackages = [ self'.packages.nvim ];
    }
  );
  perSystem = { inputs', ... }: {
    packages.nvim = inputs'.my-nvf-config.packages.default;
  };
}
