{
  flake.nixosModules.nix-ld = { pkgs, ... }: {
    programs.nix-ld = {
      enable = true;
      libraries = with pkgs; [
        glib
        glibc_multi
        nss
        nspr
        dbus
        at-spi2-atk
        at-spi2-core
        cups
        libdrm
        expat
        libxcb
        libxkbcommon
        libx11
        libxcomposite
        libxdamage
        libxext
        libxext
        libxfixes
        libxrandr
        libgbm
        pango
        cairo
        libudev-zero
        alsa-lib
      ];
    };
  };
}
