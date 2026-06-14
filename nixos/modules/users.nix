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
      packages =
        let
          utils = import ./../utils.nix;
        in
        with pkgs;
        [
          vscode

          obsidian
          zoom-us
          spotify
          zapzap
          audacity
          (utils.replaceDesktopExec unstable.discord "env DISCORD_USE_PIPEWIRE=true XDG_SESSION_TYPE=wayland discord")
          unstable.element-desktop
        ];
    };
  };
}
