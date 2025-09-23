{ pkgs, ... }:{
  services.udev = {
    enable = true;
    packages = with pkgs; [
      game-devices-udev-rules # Gaming controlers
    ]; 
    extraRules = ''
      #USB devices
      SUBSYSTEM=="usb", ATTRS{idVendor}=="28de", MODE="0666"

      #gamepad emulation
      KERNEL=="uinput", MODE="0666", GROUP="users", OPTIONS+="static_node=uinput"

      # Valve HID devices over USB hidraw
      KERNEL=="hidraw*", ATTRS{idVendor}=="28de", MODE="0666"

      # Valve HID devices over bluetooth hidraw
      KERNEL=="hidraw*", KERNELS=="*28DE:*", MODE="0666"

      # Wired HORIPAD STEAM; USB
      KERNEL=="hidraw*", KERNELS=="*0F0D:01AB*", MODE="0660", TAG+="uaccess"
      KERNEL=="hidraw*", ATTRS{idVendor}=="0f0d", ATTRS{idProduct}=="01ab", MODE="0660", TAG+="uaccess"
      
      # Wireless HORIPAD STEAM; Bluetooth
      KERNEL=="hidraw*", KERNELS=="*0F0D:0196*", MODE="0660", TAG+="uaccess"
      KERNEL=="hidraw*", ATTRS{idVendor}=="0f0d", ATTRS{idProduct}=="0196", MODE="0660", TAG+="uaccess"
      '';
  };
    hardware.uinput.enable = true;
  }