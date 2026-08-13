{
  flake.homeModules.cursors = { pkgs, ... }: {
    home.pointerCursor =
      let
        mkEnabledOptions =
          list:
          builtins.listToAttrs (
            map (name: {
              inherit name;
              value = {
                enable = true;
              };
            }) list
          );
      in
      {
        enable = true;
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
        size = 24;
      }
      // mkEnabledOptions [
        "x11"
        "gtk"
        "dotIcons"
      ];
  };
}
