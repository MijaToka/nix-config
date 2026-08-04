{
  flake.nixosModules.sshModule =
    { lib, config, ... }:
    let
      cfg = config.sshModule;
    in
    {
      options = {
        sshModule.enable = lib.mkEnableOption "SSH daemon config";
      };

      config = lib.mkIf cfg.enable {
        services.openssh.enable = true;
      };
    };
}
