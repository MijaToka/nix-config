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
      environmentConfig
      garbageCollection
      keyrings
      networkConfig
      nixSettings
      soundConfig
      sshModule
      udevRules
      wacom
      xserverConfig
    ];
  };
}
