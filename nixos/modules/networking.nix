{
  networking = {

    # Enable networking
    networkmanager.enable = true;

    hostName = "nixos"; # Define your hostname.

    wireless = {
      enable = true; # Enables wireless support via wpa_supplicant.
      iwd.enable = true;
    };
  };
}
