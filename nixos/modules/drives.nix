{
  services = {
    udisks2.enable = true;
    dbus = {
      enable = true;
      implementation = "broker";
    };
  };
}
