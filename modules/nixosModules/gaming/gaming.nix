{
  flake.nixosModules.gaming =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    let
      cfg = config.gaming;
    in
    {
      options.gaming = {
        enable = lib.mkEnableOption "basic gaming (Steam/Wine/Proton) packages";
        minecraft.enable = lib.mkEnableOption "minecraft launcher (prismlauncher)";
        osu.enable = lib.mkEnableOption "osu-laser-bin package";
      };
      config = lib.mkIf cfg.enable {
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

        environment.systemPackages = lib.mkMerge [
          (with pkgs; [
            # Gaming
            # lutris
            winetricks
            wineWow64Packages.stable
            wineWow64Packages.waylandFull
            mangohud
            protonup-ng
            protonup-qt
          ])
          (lib.mkIf cfg.minecraft.enable (
            with pkgs;
            [
              prismlauncher
            ]
          ))
          (lib.mkIf cfg.osu.enable (
            with pkgs.unstable;
            [
              osu-lazer-bin
            ]
          ))
        ];
      };
    };
}
