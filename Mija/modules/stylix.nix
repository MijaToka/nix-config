{ pkgs, inputs, ... }:{
  imports = [ inputs.stylix.homeManagerModules.stylix];
  stylix = {
    enable = true;
    polarity = "dark";
    base16scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    
    inherit (builtins) foldl';

    targets = foldl' acc: elem: acc//{${elem} = {enable = false;};} {} [
      wofi
      neovim
      hyprland
      hyprlock
      waybar
    ];

    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
      monospace = {
        name = "JetBrains Mono";
        package = pkgs.jetbrains-mono;
      };
      sansSerif = {
        name = "Noto Sans";
        package = pkgs.noto-fonts;
      };
      serif = {
        name = "Noto Serif";
        package = pkgs.noto-fonts;
      };

      sizes = {
        terminal = 14;
        applications = 12;
      };
    };
    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus Dark";
      light = "Papirus Light";
    };

    image = pkgs.fetchurl {
      url = "https://codeberg.org/lunik1/nixos-logo-gruvbox-wallpaper/raw/branch/master/png/gruvbox-dark-rainbow.png";
      sha256 = "";
    };
  };
}