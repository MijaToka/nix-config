{
  systemd.user = {
    services = {
      reset-pup-counter = {
        description = "Delete the priority in wofi of Puppy-clicker app";
        script = ''
          sed -i '/puppyclicker/d' $HOME/.cache/wofi-drun
        '';
        serviceConfig.Type = "oneshot";
      };
    };

    timers = {
      reset-pup-counter = {
        description = "Periodically reset the priority";
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnBootSec = "1m";
          OnUnitActive = "1h";
          Unit = "reset-pup-counter.service";
        };
      };
    };
  };
}
