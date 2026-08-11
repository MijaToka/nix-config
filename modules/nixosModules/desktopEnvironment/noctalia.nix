{ inputs, ... }: {
  flake.nixosModules.noctalia = {

    imports = [ inputs.noctalia.nixosModules.defalut ];

    nix.settings = {
      extra-substituters = [ "https://noctalia.cachix.org" ];
      extra-trusted-publick-keys = [
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      ];
    };
    programs = {
      noctalia = {
        enable = true;
        recommendedServices.enable = true;
      };
    };
  };
}
