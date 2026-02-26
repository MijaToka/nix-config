{ lib, ... }:
{
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  networking = {

    # DNS nameservers
    nameservers = [ ];
    # Enable networking
    networkmanager = {
      enable = true;
      wifi.powersave = true;
      insertNameservers = [
        "1.1.1.1"
        "9.9.9.9"
      ];
    };

    hostName = "nixos"; # Define your hostname.

    wireless = {
      enable = lib.mkDefault false; # Enables wireless support via wpa_supplicant.
      iwd.enable = false;
    };
  };
}
