{ inputs, moduleWithSystem, ... }: {
  flake.nixosModules.kitty = moduleWithSystem (
    { self', ... }: { pkgs, ... }: {
      nixpkgs.overlays = [
        (_: _: { kitty = self'.packages.kitty; })
      ];
      environment.systemPackages = [ pkgs.kitty ];
    }
  );
  perSystem =
    { pkgs, ... }:
    {
      packages.kitty = inputs.wrapper-modules.wrappers.kitty.wrap {
        inherit pkgs;
        environment."FONTCONFIG_FILE" = "${pkgs.makeFontsConf {
          fontDirectories = [ pkgs.nerd-fonts.jetbrains-mono ];
        }}";
        font = {
          name = "JetBrains Mono";
          size = 12;
        };
        settings = {
          confirm_os_window_close = 0;
          remember_window_size = false;
          dynamic_background_opacity = true;
          enable_audio_bell = false;
          window_padding_width = 10;
          background_opacity = 0.50;
          background_blurr = 3;
        }
        // {
          color0 = "#17233b";
          color1 = "#cb817f";
          color2 = "#6792e4";
          color3 = "#8070ec";
          color4 = "#a966cc";
          color5 = "#93b1ec";
          color6 = "#a296e9";
          color7 = "#f2f2f3";
          color8 = "#606670";
          color9 = "#cb817f";
          color10 = "#6792e4";
          color11 = "#8070ec";
          color12 = "#a966cc";
          color13 = "#93b1ec";
          color14 = "#a296e9";
          color15 = "#f2f2f3";

          cursor = "#f2f2f3";
          cursor_text_color = "#111a2c";
          background = "#111a2c";
          foreground = "#f2f2f3";
          selection_foreground = "#afb1b6";
          selection_background = "#17233b";
          active_border_color = "#6792e4";
          inactive_border_color = "#17233b";
          url_color = "#6792e4";

          active_tab_foreground = "#181d25";
          active_tab_background = "#6792e4";
          inactive_tab_foreground = "#afb1b6";
          inactive_tab_background = "#17233b";
          cursor_trail_color = "#afb1b6";
        };

      };
    };
}
