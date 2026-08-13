{
  self,
  inputs,
  ...
}:
{
  flake.nixosModules.users =
    {
      pkgs,
      config,
      ...
    }:
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];

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

      home-manager = {
        backupFileExtension = "bkp";
        useGlobalPkgs = true;
        useUserPackages = true;
        users.mija = {
          imports = with self.homeModules; [
            cursors
            git
            hyprBundle
            kitty
            mpv
            stylix
            swaync
            udiskie
            wofi
            xdgConfig
            zsh
          ];
          home.stateVersion = config.system.stateVersion;
        };
      };
    };
}
