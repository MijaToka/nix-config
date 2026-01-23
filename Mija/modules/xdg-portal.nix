{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    config = {
      hyprland.preferred = [
        "gtk"
        "hyprland"
      ];
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };

}
