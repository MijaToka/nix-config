{ config, ... }: let
  base16Scheme = config.stylix.base16Scheme;
in{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        # disable_loading_bar = true;
        # gracie = 10;
        hide_cursor = false;
        ignore_empty_input = true;
        text_trim = true;
        fractional_scaling = 2;
        fail_timeout = 1000; #ms
        # no_fade_in = false;
      };

      label = {
        text = "$TIME";
        font_size = 96;
        font_family = "JetBrains Mono";
        color = "rgba(235, 219, 178, 1.0)";
        position = "0,600";
        halign = "center";
        valign = "center";
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      auth = {
        pam = {
          enabled = true;
          module = "hyprlock";
        };
        fingerprint = {
          enabled = true;
          ready_message = "Scan fingerprint to unlock";
          present_message = "Scanning fingerprint";
          retry_delay = 250; #ms
        };
      };

      input-field = [
        {
          size = "200,50";
          position = "0,-80";
          monitor = "";
          dots_center = true;
          font_color = "rgb(235, 219, 178)";
          inner_color = "rgb(40, 40, 40)";
          outer_color = "rgb(60, 56, 54)";
          outline_thickness = 5;
          placeholder_text = "sussy baka";
          shadow_passes = 1;
        }
      ];
    };
  };
}
