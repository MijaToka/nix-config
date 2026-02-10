{ inputs, ... }:
{
  imports = [ inputs.aagl.nixosModules.default ];
  nix.settings = inputs.aagl.nixConfig;
  programs = {
    anime-game-launcher.enable = true;
    # anime-games-launcher.enable = true; #Hoyoverse launcher
    # honkers-railway-launcher.enable = true; #HSR
    # honkers-launcher.enable = true; # Honkay3rd
    # wavey-launcher.enable = true; # WuWa (not working)
    # sleepy-launcher.enable = true; # ZZZ
  };
}
