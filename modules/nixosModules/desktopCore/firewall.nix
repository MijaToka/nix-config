{
  flake.nixosModules.firewall = {
    networking.firewall = {
      /*nixfmt:disable*/
      allowedUDPPorts = [ 53 67 68 ];
      /*nixfmt:enable*/
    };
  };
}
