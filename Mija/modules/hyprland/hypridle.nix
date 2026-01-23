{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hypctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "pidof hyprlock || hyprlock";
      };

      listener = [
        {
          timeout = 210; # 3.5 min
          on-timeout = "brightnessctl -s set 30";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 300; # 5 min
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 600; # 10 min
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 1800; # 30 min
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
