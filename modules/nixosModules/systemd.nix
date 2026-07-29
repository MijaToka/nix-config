{
  flake.nixosModules.powerKey = {
    services.logind.settings.Login.HandlePowerKey = "suspend";
  };
}
