{ pkgs, inputs, ... }:
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
          wasistlos
          audacity
        ]
        ++ (with inputs.nixpkgs-unstable; [
          (utils.replaceDesktopExec discord "env DISCORD_USE_PIPEWIRE=true XDG_SESSION_TYPE=wayland discord")
          element-desktop
        ]);
    };
  };
}
