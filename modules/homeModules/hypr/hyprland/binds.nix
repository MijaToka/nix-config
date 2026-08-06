{
  moduleWithSystem,
  ...
}:
{
  flake.homeModules.hyprland = moduleWithSystem (
    { inputs', ... }: { lib, pkgs, ... }: {
      wayland.windowManager.hyprland.settings =
        let
          luaInLine = lib.generators.mkLuaInline;
          mkVar = value: { _var = value; };
        in
        {
          terminal = mkVar "${lib.getExe pkgs.kitty}";
          fileManager = mkVar "${lib.getExe pkgs.kitty} ${lib.getExe pkgs.yazi}";
          menu = mkVar "${lib.getExe pkgs.wofi} --show drun";
          browser = mkVar "${lib.getExe inputs'.zen-browser.packages.default}";

          bind =
            let
              mkBindWithFlags = key: dispatcher: command: flags: {
                _args = [
                  key
                  (luaInLine "hl.dsp.${dispatcher}(${command})")
                  flags
                ];
              };

              mkBind =
                key: dispatcher: command:
                (mkBindWithFlags key dispatcher command { });

              mkWSMovement = key: wsIdx: [
                (mkBind "SUPER + ${toString key}" "focus" "{ workspace = ${toString wsIdx} }")
                (mkBind "SUPER + SHIFT + ${toString key}" "window.move"
                  "{ workspace = ${toString wsIdx}, follow = true }"
                )
              ];

              WSMovement = lib.flatten [
                (map (workspace: mkWSMovement workspace workspace) [
                  1
                  2
                  3
                  4
                  5
                  6
                  7
                  8
                  9
                ])
                [
                  (mkWSMovement 0 10)
                  (mkWSMovement "TAB" ''"special:magic"'')
                ]
              ];
            in
            [

              (mkBind "SUPER + Return" "exec_cmd" "terminal")
              (mkBind "SUPER + SHIFT + Escape" "exec_cmd" ''"systemctl suspend"'')
              (mkBind "SUPER + Escape" "exec_cmd" ''"loginctl lock-session"'')
              (mkBind "SUPER + Q" "window.close" "")
              (mkBind "SUPER + SHIFT + Q" "window.kill" "")
              (mkBind "SUPER + Delete" "exit" "")
              (mkBind "SUPER + E" "exec_cmd" "browser")
              (mkBind "SUPER + R" "exec_cmd" "fileManager")
              (mkBind "SUPER + F" "window.float" "")
              (mkBind "SUPER + SHIFT + F" "window.fullscreen" ''{ action = "toggle" }'')
              (mkBind "SUPER + SPACE" "exec_cmd" "menu")
              (mkBind "SUPER + P" "window.pseudo" "")
              (mkBind "SUPER + O" "layout" ''"togglesplit"'')
              (mkBind "SUPER + SHIFT + O" "layout" ''"swapsplit"'')

              #Move focus with SUPER + arrow keys
              (mkBind "SUPER + left" "focus" ''{ direction = "l" }'')
              (mkBind "SUPER + right" "focus" ''{ direction = "r" }'')
              (mkBind "SUPER + up" "focus" ''{ direction = "u" }'')
              (mkBind "SUPER + down" "focus" ''{ direction = "d" }'')

              (mkBind "SUPER + H" "focus" ''{ direction = "l" }'')
              (mkBind "SUPER + L" "focus" ''{ direction = "r" }'')
              (mkBind "SUPER + J" "focus" ''{ direction = "u" }'')
              (mkBind "SUPER + K" "focus" ''{ direction = "d" }'')

              #Scroll through existing workspaces with SUPER + scroll
              (mkBind "SUPER + mouse_down" "focus" ''{ workspace = "e-1" }'')
              (mkBind "SUPER + mouse_up" "focus" ''{ workspace = "e+1" }'')

              #Screenshot (continued in bindo)
              (mkBind "Print" "exec_cmd" ''"hyprshot -m region"'')
              (mkBind "SHIFT + Print" "exec_cmd" ''"${lib.getExe pkgs.hyprshot} -m window"'')
              (mkBind "SUPER + Print" "exec_cmd" ''"${lib.getExe pkgs.hyprshot} -m output"'')

              (mkBindWithFlags "SUPER + mouse:272" "window.drag" "" { mouse = true; })
              (mkBindWithFlags "SUPER + mouse:273" "window.resize" "" { mouse = true; })

              # Laptop multimedia keys for volume and LCD brightness
              (mkBind "XF86AudioRaiseVolume" "exec_cmd" ''"wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"'')
              (mkBind "XF86AudioLowerVolume" "exec_cmd" ''"wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"'')
              (mkBind "XF86AudioMute" "exec_cmd" ''"wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"'')
              (mkBind "XF86AudioMicMute" "exec_cmd" ''"wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"'')
              (mkBind "XF86MonBrightnessUp" "exec_cmd" ''"${lib.getExe pkgs.brightnessctl} -e4 -n2 set 5%+"'')
              (mkBind "XF86MonBrightnessDown" "exec_cmd" ''"${lib.getExe pkgs.brightnessctl} -e4 -n2 set 5%-"'')

              # Requires playerctl
              (mkBind "XF86AudioNext" "exec_cmd" ''"${lib.getExe pkgs.playerctl} next"'')
              (mkBind "XF86AudioPause" "exec_cmd" ''"${lib.getExe pkgs.playerctl} play-pause"'')
              (mkBind "XF86AudioPlay" "exec_cmd" ''"${lib.getExe pkgs.playerctl} play-pause"'')
              (mkBind "XF86AudioPrev" "exec_cmd" ''"${lib.getExe pkgs.playerctl} previous"'')

            ]
            ++ WSMovement;

        };
    }
  );
}
