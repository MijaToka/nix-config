{ lib, ... }:
{

  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      enable_audio_bell = false;
      window_padding_width = 10;
      background_opacity = lib.mkForce "0.5";
      background_blurr = 3;

    };
  };
}
