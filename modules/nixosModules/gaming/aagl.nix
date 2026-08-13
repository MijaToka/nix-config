{ inputs, ... }:
{
  flake.nixosModules.genshin =
    { config, lib, ... }:
    let
      cfg = config.gaming;
    in
    {
      imports = [ inputs.aagl.nixosModules.default ];
      options = {
        gaming.genshin.enable = lib.mkEnableOption "Anime-Game-Launcher (Genshin)";
      };
      config = lib.mkIf (cfg.enable && cfg.genshin.enable) {
        nix.settings = inputs.aagl.nixConfig;
        programs = {
          anime-game-launcher.enable = true;
          # anime-games-launcher.enable = true; #Hoyoverse launcher
          # honkers-railway-launcher.enable = true; #HSR
          # honkers-launcher.enable = true; # Honkay3rd
          # wavey-launcher.enable = true; # WuWa (not working)
          # sleepy-launcher.enable = true; # ZZZ
        };
      };
    };
}
