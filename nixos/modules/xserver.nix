{
  services.xserver = {
    enable = true;
  
    # Keymap for X11
    xkb = {
      layout = "latam";
      variant = "";
    };
  };

  # Enable touchpad in X11
  services.libinput.enable = true;

}