{
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      control-centre-radius = 1;
      fit-to-screen = true;
      layer-shell = true;
      layer-overlay = true;
      layer = "overlay";
      control-center-layer = "overlay";
      cssPriority = "user";
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;

      widgets = [
        "inhibitors"
        "dnd"
        "mpris"
        "notifications"
      ];
      widgets-config = {
        title = {
          text = "notifications";
          clear-all-button = true;
          button-text = "Clear All";
        };
        dnd = {
          enabled = true;
          text = "Do not Disturb";
        };
        mpris = {
          enabled = true;
          image-size = 60;
          blur = true;
        };
        inhibitors = {
          enabled = true;
        };
      };
    };
  };
}
