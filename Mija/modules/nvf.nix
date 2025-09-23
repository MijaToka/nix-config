{ config, lib, ... }:let
  base16Scheme = config.stylix.base16Scheme;
  base16-colors = lib.filterAttrs
    (name: value: builtins.match "base0[0-9A-F]" name != null)
    base16Scheme;
in {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme = {
          enable = true;
          name = "base16";
          inherit base16-colors;
          style = "dark";
          transparent = true;
        };
        lsp.enable = true;

        languages = {
          enableTreesitter = true;

          nix.enable = true;
          python.enable = true;
          markdown.enable = true;
          clang.enable = true;
        };

        statusline.lualine = {
          enable = true;
          theme = "auto";
        };
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;

        options = {
          tabstop = 2;
          shiftwidth = 2;
        };
      };
    };
  };
}
