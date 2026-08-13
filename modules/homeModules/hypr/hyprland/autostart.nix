{ moduleWithSystem, ... }: {
  flake.homeModules.hyprland = moduleWithSystem (
    { pkgs, ... }:
    { lib, ... }: {
      wayland.windowManager.hyprland.settings = {
        on = {
          _args = [
            "hyprland.start"
            (lib.generators.mkLuaInline ''
              function ()
                hl.exec_cmd("${lib.getExe pkgs.quickshell} -p ~/.dotfiles/quickshell/shell.qml")
                hl.exec_cmd("${pkgs.gnome-keyring}/bin/gnome-keyring-daemon --start --components=secrets")
                hl.exec_cmd("${lib.getExe pkgs.easyeffects} -w")
              end 
            '')
          ];
        };
      };
    }
  );
}
