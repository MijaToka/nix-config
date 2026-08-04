{
  self,
  ...
}:
{
  flake.nixosModules.desktopModuleBundle = { lib, ... }: {
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
    config = {
      batteryManagement.enable = lib.mkDefault true;
      bluetoothManagement.enable = lib.mkDefault true;
      sshModule.enable = lib.mkDefault true;
      keyring.enable = lib.mkDefault true;
    };
  };
}
