{
  flake.nixosModules.timeZoneLocale = {
    services.automatic-timezoned.enable = true;
    i18n = {
      defaultLocale = "en_US.UTF-8";
      extraLocaleSettings.LC_ALL = "es_CL.UTF-8";
    };
  };
}
