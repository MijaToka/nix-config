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
          packages = with pkgs; [
            vscode

            obsidian
            zoom-us
            spotify
            zapzap
            audacity
            unstable.discord
            unstable.element-desktop
          ];
        };
      };
    };
}
