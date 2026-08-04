{
  flake.nixosModules.users =
    {
      pkgs,
      ...
    }:
    {
      users = {
        defaultUserShell = pkgs.zsh;

        users.mija = {
          isNormalUser = true;
          description = "Mijail Tokarev";
          extraGroups = [
            "networkmanager"
            "wheel"
            "input"
            "libvirtd"
          ];
          initialPassword = "password";
        };
      };
    };
}
