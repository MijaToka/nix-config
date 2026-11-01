{ inputs, moduleWithSystem, ... }: {
  flake.nixosModules.git = moduleWithSystem (
    { self', ... }: _: {
      programs.git = {
        enable = true;
        package = self'.packages.git;
      };
    }
  );

  perSystem = { pkgs, ... }: {
    packages.git = inputs.wrapper-modules.wrappers.git.wrap {
      inherit pkgs;
      settings = {
        user = {
          name = "MijaToka";
          email = "mijail.tokarev@ug.uchile.cl";
        };
        core.Editor = "nvim";
        init.defaultBranch = "main";
      };
    };
  };
}
