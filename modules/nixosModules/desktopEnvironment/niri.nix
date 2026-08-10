{ inputs, ... }: {
  flake.nixosModules.niri = {
    imports = [ inputs.noctalia.nixosModules.default ];
    programs.niri = {
      enable = true;
      noctalia = {
        enable = true;
        recommendedServices.enable = true;
      };
    };
  };
}
