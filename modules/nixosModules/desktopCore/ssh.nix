{
  flake.nixosModules.sshModule = {
    services.openssh.enable = true;
  };
}
