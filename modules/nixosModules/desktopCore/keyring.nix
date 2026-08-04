{
  flake.nixosModules.keyrings =
    { config, lib, ... }:
    let
      cfg = config.keyring;
    in
    {
      options = {
        keyring.enable = lib.mkEnableOption "keyring packages installation";
      };
      config = lib.mkIf cfg.enable {
        programs.seahorse.enable = true;
        services.gnome.gnome-keyring.enable = true;
        security.pam.services.hyprland.enableGnomeKeyring = true;
      };
    };
}
