{
  pkgs,
  lib,
  ...
}:
{
  boot = {
    # Boot loader
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;

      # Hide generation choice
      #(to choose, press a key during booting)
      timeout = 0;
    };

    #Bootloader animation
    plymouth = {
      enable = true;
      theme = "blockchain";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "blockchain" ];
        })
      ];
    };

    tmp.cleanOnBoot = true;

    # Enable Silent Boot
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];

    #Kernel fix to patch copyfail (can remove when the kernel version is fixed)
    kernelPackages = lib.mkIf (lib.versionOlder pkgs.linux.version "6.18.22") (
      lib.mkDefault pkgs.linuxPackages_6_18
    );
  };
}
