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
      imports = with self.nixosModules; [
        gaming
        genshin
      ];
      config.gaming = {
        enable = lib.mkDefault true;
        osu.enable = lib.mkDefault false;
        genshin.enable = lib.mkDefault false;
      };
    };
}
