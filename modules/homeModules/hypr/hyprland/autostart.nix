{
  flake.homeModules.hyprland = { lib, ... }: {
    wayland.windowManager.hyprland.settings = {
      on = {
        _args = [
          "hyprland.start"
          (lib.generators.mkLuaInline ''
            function ()
              hl.exec_cmd("quickshell -p ~/.dotfiles/quickshell/shell.qml")
              hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
              hl.exec_cmd("easyeffects -w")
            end 
          '')
        ];
      };
    };
  };
}
