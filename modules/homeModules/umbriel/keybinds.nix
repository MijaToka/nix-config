{ moduleWithSystem, ... }: {
  flake.homeModules.umbriel = moduleWithSystem (
    { inputs', pkgs, ... }: { lib, ... }: {
      programs.umbriel.settings = {
        keybinds =
          let
            mkWorkspaceBind = wsNum: {
              "Mod+${toString wsNum}" = "workspace-switch:${toString wsNum}";
              "Mod+Shift+${toString wsNum}" = "window-move-to-workspace:${toString wsNum}";
            };

          /*nixfmt:disable*/
          workspaceBinds = lib.mergeAttrsList (map mkWorkspaceBind [ 1 2 3 4 5 6 7 8 9 ]);
          /*nixfmt:enable*/

            mkMovementBind = direction: key: {
              "Mod+${key}" = "window-focus-${direction}";
              "Mod+Shift+${key}" = "window-move-or-output-${direction}";
            };

            movementsBinds = lib.mergeAttrsList (
              lib.flatten [
            /*nixfmt:disable*/
              (map (mkMovementBind "up") [ "Up" "W" "K" ])
              (map (mkMovementBind "down") [ "Down" "S" "J" ])
              (map (mkMovementBind "left") [ "Left" "A" "H" ])
              (map (mkMovementBind "right") [ "Right" "D" "L" ])
            /*nixfmt:enable*/
              ]
            );

            noctaliaExe = lib.getExe inputs'.noctalia.packages.default;

            inherit (lib) getExe;
          in
          {
            "Mod+Return" = "spawn:${getExe pkgs.kitty}";
            "Mod+Escape" = "spawn:${noctaliaExe} msg session lock";
            "Mod+Shift+Escape" = "spawn:${noctaliaExe} msg session lock-and-suspend";
            "Mod+Q" = "window-close";
            "Mod+Delete" = "spawn:${noctaliaExe} msg session logout";
            "Mod+E" = "spawn:${getExe inputs'.zen-browser.packages.default}";
            "Mod+R" = "spawn:${getExe pkgs.kitty} ${getExe pkgs.yazi}";

            "Mod+Tab" = "scratchpad-toggle";
            "Mod+Shift+Tab" = "window-toggle-scratchpad";

            "Mod+F" = "window-toggle-floating";
            "Mod+Shift+F" = "window-toggle-fullscreen";
            "Mod+M" = "window-toggle-maximize-to-edges";
            "Mod+C" = "window-cycle-primary-extent";
            "Mod+Shift+C" = "window-cycle-primary-extent-back";

            "Mod+Space" = "spawn:${noctaliaExe} msg panel-toggle launcher";

            "Mod+Comma" = "window-consume-left";
            "Mod+Period" = "window-consume-right";

            "Mod+WheelUp" = "workspace-next";
            "Mod+WheelDown" = "workspace-previous";

            "Print" = "spawn:${noctaliaExe} msg screenshot-region";
            "Mod+Print" = "spawn:${noctaliaExe} msg screenshot-fullscreen pick";

            "XF86AudioRaiseVolume" = "spawn:wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
            "XF86AudioLowerVolume" = "spawn:wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
            "XF86AudioMute" = "spawn:wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            "XF86AudioMicMute" = "spawn:wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

            "XF86MonBrightnessDown" = {
              action = "spawn:${noctaliaExe} msg brightness-down 10";
              allow_when_locked = true;
            };
            "XF86MonBrightnessUp" = {
              action = "spawn:${noctaliaExe} msg brightness-up 10";
              allow_when_locked = true;
            };

            "XF86AudioPlay" = "spawn:${getExe pkgs.playerctl} play-pause";
            "XF86AudioPause" = "spawn:${getExe pkgs.playerctl} play-pause";
            "XF86AudioNext" = "spawn:${getExe pkgs.playerctl} next";
            "XF86AudioPrev" = "spawn:${getExe pkgs.playerctl} previous";
          }
          // workspaceBinds
          // movementsBinds;

        hot_corners = {
          bottom_right = {
            enabled = true;
            delay_ms = 500;
            action = "overview-toggle";
          };
        };
      };
    }
  );
}
