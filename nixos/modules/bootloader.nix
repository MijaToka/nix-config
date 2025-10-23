{ pkgs, ... }:
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

  };
}
