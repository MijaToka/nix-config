let 
  base16-colors = { 
    base00 = "0f1c2c";
    base01 = "3c4566";
    base02 = "9c5560";
    base03 = "a092ea";
    base04 = "f5a3a5";
    base05 = "fedbd7";
    base06 = "e9f2fb";
    base07 = "e6f2fe";
    base08 = "c57e72";
    base09 = "8692aa";
    base0A = "b78191";
    base0B = "6791d9";
    base0C = "ab859c";
    base0D = "9287d5";
    base0E = "c77c81";
    base0F = "918bbb";
  };
in {
  vim.theme = {
    enable = true;
    name = "base16";
    inherit base16-colors;
    style = "dark";
    transparent = true;
  };
}
