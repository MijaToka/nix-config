{
  flake.nixosModules.thunderbird = { pkgs, ... }: {
    programs.thunderbird = {
      enable = true;
    };

    environment.systemPackages = [ pkgs.birdtray ];
  };
}
