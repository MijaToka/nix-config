{ pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
    gamemode.enable = true;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  environment.systemPackages = with pkgs; [
    # Gaming
    # lutris
    winetricks
    wineWow64Packages.stable
    wineWow64Packages.waylandFull
    mangohud
    protonup-ng
    protonup-qt

    prismlauncher # Minecraft
  ];
}
