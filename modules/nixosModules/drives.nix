{
  flake.nixosModules.usbAutomount = {
    services = {
      udisks2.enable = true;
      dbus = {
        enable = true;
        implementation = "broker";
      };
    };
  };
}
