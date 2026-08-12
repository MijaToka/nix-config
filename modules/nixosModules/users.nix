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
        useGlobalPkgs = true;
        useUserPackages = true;
        users.mija = {
          imports = with self.homeModules; [
            git
            hyprBundle
            kitty
            mpv
            stylix
            swaync
            udiskie
            xdgConfig
            zsh
          ];
          home.stateVersion = config.system.stateVersion;
        };
      };
    };
}
