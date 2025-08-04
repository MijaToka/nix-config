with import <nixpkgs> {};

let
  hexToCssRGB = import ./util.nix {inherit lib;};
in {
  color1 = hexToCssRGB {hex= "1d1f21";};
  color2 = hexToCssRGB {hex = "1d1f21"; alpha = 0.5;};
}

