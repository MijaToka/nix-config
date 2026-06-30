{ inputs, ... }:
{
  imports = [ inputs.odysseus.nixosModules.default ];
  services.odysseus = {
    enable = true;
    environmentFile = "/var/lib/odysseus/odysseus-env";
  };
}
