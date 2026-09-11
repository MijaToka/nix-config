{ moduleWithSystem, ... }: {
  flake.homeModules.hyprland = moduleWithSystem (
    { pkgs, ... }:
    { lib, ... }: {
      wayland.windowManager.hyprland.settings = {
        on = {
          _args =
            let
              mkExecCmd = command: ''hl.exec_cmd("${command}")'';
              foldCmds = cmdList: (lib.foldl (l: r: l + "\n\t" + r) "" (map mkExecCmd cmdList));
              mkFunctionLine =
                cmdList: (lib.generators.mkLuaInline ("function ()" + (foldCmds cmdList) + "\nend"));
            in
            [
              "hyprland.start"
              (mkFunctionLine [
                "${lib.getExe pkgs.quickshell} -p ~/.dotfiles/quickshell/shell.qml"
                "${pkgs.gnome-keyring}/bin/gnome-keyring-daemon --start --components=secrets"
                "${lib.getExe pkgs.easyeffects} -w"
                "hyprctl setcursor Bibata-Modern-Ice 20"
              ])
            ];
        };
      };
    }
  );
}
