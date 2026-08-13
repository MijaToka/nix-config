{
  flake.nixosModules.bluetoothManagement =
    { config, lib, ... }:
    let
      cfg = config.bluetoothManagement;
    in
    {
      options = {
        bluetoothManagement.enable = lib.mkEnableOption "bloetooth configuration module";
      };
      config = lib.mkIf cfg.enable {
        hardware.bluetooth = {
          enable = true;
          powerOnBoot = true;
          settings.General = {
            Enable = "Source,Sink,Media,Socket";
            Experimental = true;
          };
        };
        services.blueman.enable = true;
      };
    };
}
