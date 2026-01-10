{ lib, ... }:
{
  networking = {

    # Enable networking
    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };

    hostName = "nixos"; # Define your hostname.

    wireless = {
      enable = lib.mkDefault false; # Enables wireless support via wpa_supplicant.
      iwd.enable = false;
    };
  };
}
