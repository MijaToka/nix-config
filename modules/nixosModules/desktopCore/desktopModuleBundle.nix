{
  self,
  ...
}:
{
  flake.nixosModules.desktopModuleBundle = {
    imports = with self.nixosModules; [
      batteryManagement
      bluetoothManagement
      bootloader
      displayManagerConfig
      installedPackages
      usbAutoMount
      envirnonmentConfig
      fprintAuthentication
      garbageCollection
      keyrrings
      networkConfig
      soundConfig
      udevRules
      wacom
      xserver
    ];
  };
}
