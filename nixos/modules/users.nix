{ pkgs, ... }:
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

        (discord.overrideAttrs (oldAttrs: rec {
          desktopItem = oldAttrs.desktopItem.override {
            exec = "env DISCORD_USE_PIPEWIRE=true XDG_SESSION_TYPE=wayland discord";
          };
          postInstall =
            builtins.replaceStrings
              [
                "${oldAttrs.desktopItem}"
              ]
              [
                "${desktopItem}"
              ]
              oldAttrs.postInstall;
        }))

        obsidian
        zoom-us
        spotify
        wasistlos
        audacity
      ];
    };
  };
}
