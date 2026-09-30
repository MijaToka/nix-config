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
      environmentConfig
      fonts
      hyprland
      installedPackages
      garbageCollection
      keyrings
      networkConfig
      nixSettings
      soundConfig
      sshModule
      timeZoneLocale
      udevRules
      udisks
      usbAutoMount
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
