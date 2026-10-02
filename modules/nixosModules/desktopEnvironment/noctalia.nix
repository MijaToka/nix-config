{ inputs, ... }: {
  flake.nixosModules.noctalia = { pkgs, ... }: {

    imports = [ inputs.noctalia.nixosModules.default ];

    programs = {
      noctalia = {
        enable = true;
        recommendedServices.enable = true;
      };
    };
    # Dependencies of plugins
    environment.systemPackages = with pkgs; [
      # Spotify plugin
      unstable.spotify-player
      python3
      gtk3
    ];
  };
}
