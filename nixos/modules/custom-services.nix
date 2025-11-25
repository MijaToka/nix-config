{
  systemd.services = {

    unbind-wacom = {
      description = "Unbind wacom driver from wacom tablet so that openTabletDriver can use it.";
      wantedBy = [ ];
      serviceConfig = {
        type = "oneshot";
        ExecStart = ''
          for dev in /sys/bus/hid/devices/*; do 
            if grep -qi "Vendor=056a" "$dev/uevent"; then
              echo "$(basename $dev)" > /sys/bus/hid/drivers/wacom/unbind || true 
            fi 
          done
        '';
      };
    };

    rebind-wacom = {
      description = "Rebind wacom driver from wacom tablet.";
      wantedBy = [ ];
      serviceConfig = {
        type = "oneshot";
        ExecStart = ''
          for dev in /sys/bus/hid/devices/*; do 
            if grep -qi "Vendor=056a" "$dev/uevent"; then
              echo "$(basename $dev)" > /sys/bus/hid/drivers/wacom/bind || true 
            fi 
          done
        '';
      };
    };

  };
}
