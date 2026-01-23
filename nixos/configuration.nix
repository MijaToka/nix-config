# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules
    ./packages.nix
  ];

  # Enable Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  services = {
    # Enable the OpenSSH daemon.
    openssh.enable = true;

    # Set your time zone.
    # time.timeZone = "Europe/Paris";
    automatic-timezoned.enable = true;

    # Enable CUPS to print documents.
    printing.enable = true;
  };

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ALL = "es_CL.UTF-8";
      # LC_ADDRESS = "es_CL.UTF-8";
      # LC_IDENTIFICATION = "es_CL.UTF-8";
      # LC_MEASUREMENT = "es_CL.UTF-8";
      # LC_MONETARY = "es_CL.UTF-8";
      # LC_NAME = "es_CL.UTF-8";
      # LC_NUMERIC = "es_CL.UTF-8";
      # LC_PAPER = "es_CL.UTF-8";
      # LC_TELEPHONE = "es_CL.UTF-8";
      # LC_TIME = "es_CL.UTF-8";
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Configure console keymap
  console.keyMap = "la-latin1";

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
