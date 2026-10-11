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
          size = 14;
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
          # The basic colors
          background = "#0f1c2c";
          foreground = "#fedbd7";
          selection_background = "#a092ea";
          selection_foreground = "#fedbd7";

          # Cursor colors
          cursor = "#fedbd7";
          cursor_text_color = "#0f1c2c";

          # URL underline color when hovering with mouse
          url_color = "#f5a3a5";

          # Kitty window border colors
          active_border_color = "#a092ea";
          inactive_border_color = "#3c4566";

          # OS Window titlebar colors
          wayland_titlebar_color = "#0f1c2c";
          macos_titlebar_color = "#0f1c2c";

          # Tab bar colors
          active_tab_background = "#0f1c2c";
          active_tab_foreground = "#fedbd7";
          inactive_tab_background = "#3c4566";
          inactive_tab_foreground = "#f5a3a5";
          tab_bar_background = "#3c4566";

          # The 16 terminal colors
          # normal
          color0 = "#0f1c2c";
          color1 = "#c57e72";
          color2 = "#6791d9";
          color3 = "#b78191";
          color4 = "#9287d5";
          color5 = "#c77c81";
          color6 = "#ab859c";
          color7 = "#fedbd7";

          # bright
          color8 = "#9c5560";
          color9 = "#c57e72";
          color10 = "#6791d9";
          color11 = "#b78191";
          color12 = "#9287d5";
          color13 = "#c77c81";
          color14 = "#ab859c";
          color15 = "#e6f2fe";

          # extended base16 colors
          color16 = "#8692aa";
          color17 = "#918bbb";
          color18 = "#3c4566";
          color19 = "#9c5560";
          color20 = "#f5a3a5";
          color21 = "#e9f2fb";
        };

      };
    };
}
