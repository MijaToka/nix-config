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
        discord
        obsidian
        zoom-us
        spotify
        whatsapp-for-linux
        audacity
      ];
    };
  };
}
