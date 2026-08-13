{
  self,
  inputs,
  ...
}:
let
  moduleName = "template";
in
{
  flake.nixosModules.${moduleName} =
    { config, lib, ... }:
    let
      cfg = config.${moduleName};
    in
    {
      options = {
        ${moduleName} = lib.mkEnableOption "${moduleName} module";
      };
      config = lib.mkIf cfg.enable { };
    };
}
