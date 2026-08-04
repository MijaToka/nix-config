{
  self,
  ...
}:
{
  flake.nixosModules.gamingModuleBundle =
    {
      lib,
      ...
    }:
    {
      options = {
        gaming = {
          enable = lib.mkEnableOption "Enable core gaming module";
          osu.enable = lib.mkEnableOption "Enable osu module";
          genshin.enable = lib.mkEnableOption "Enable Genshin Launcher module";
        };
      };
      imports = with self.nixosModules; [
        gaming
        osu
        genshin
      ];
    };
}
