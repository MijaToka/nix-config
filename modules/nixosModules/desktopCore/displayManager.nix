{
  flake.nixosModules.displayManagerConfig =
    { pkgs, ... }:
    {

      # Enable automatic login for the user.
      services.displayManager = {

        ly = {
          enable = true;
          settings = {
            # animation = "dur";
            # dur_file_path =
            #   let
            #     ly-community = pkgs.fetchFromGitea {
            #       domain = "codeberg.org";
            #       owner = "fairyglade";
            #       repo = "ly-community";
            #       rev = "fd85d8584545433520f34fb25584b17280f4c0b9";
            #       hash = "sha256-VIGoo+4SCU3VLeQ9iw2Bj2hK/iIzMwmFI5Kox3p/CNM=";
            #     };
            #   in
            #   "${ly-community}/animations/dur/blackhole-smooth-240x67.dur";
          };
        };

        sddm = {
          enable = false;
          wayland.enable = true;
          package = pkgs.kdePackages.sddm;
          extraPackages = with pkgs.kdePackages; [
            qtsvg
            qtmultimedia
            qtvirtualkeyboard
          ];
          theme = "sddm-astronaut-theme";

        };

        autoLogin = {
          enable = false;
          user = "mija";
        };

      };

      #Install theme
      environment.systemPackages = with pkgs; [
        (sddm-astronaut.override {
          embeddedTheme = "black_hole";
        })
      ];
    };
}
