{ inputs, ... }: {
  flake.homeModules.stylix =
    { pkgs, ... }:
    {
      imports = [ inputs.stylix.homeModules.stylix ];
      stylix = {
        enable = true;
        # base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
        polarity = "dark";

        targets =
          let
            disabledList = [
              "wofi"
              "neovim"
              "hyprland"
              "hyprlock"
              "hyprpaper"
              "waybar"
              "vscode"
              "mako"
              "wpaperd"
            ];
            disabledTargets = builtins.listToAttrs (
              map (name: {
                inherit name;
                value = {
                  enable = false;
                };
              }) disabledList
            );
          in
          disabledTargets;

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
          url = "https://i.imgur.com/7Q7MPWC.jpeg";
          sha256 = "sha256-4R7KkpbSlFIjlYMS1tmkwpKcEUSNp97EHQM1C4XrBoM=";
        };
      };
    };
}
