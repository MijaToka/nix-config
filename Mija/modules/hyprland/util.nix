{ lib, ... }:
(
  let
    hexToCssRGB =
      {
        hex,
        alpha ? null,
      }:
      let
        r = builtins.fromJSON ("0x${builtins.substring 0 2 hex}");
        g = builtins.fromJSON ("0x${builtins.substring 2 2 hex}");
        b = builtins.fromJSON ("0x${builtins.substring 4 2 hex}");
      in
      if alpha != null then "rgba(${r},${g},${b},${toString alpha})" else "rgb(${r},${g},${b})";
  in
  hexToCssRGB
)
