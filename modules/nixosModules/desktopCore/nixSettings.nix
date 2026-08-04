{
  self,
  ...
}:
{
  flake.nixosModules.nixSettings = { lib, ... }: {
    nix = {
      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
    };
    nixpkgs = {
      hostPlatform.system = lib.mkDefault "x86_64-linux";
      config.allowUnfree = true;
      overlays = [
        self.overlays.unstable-channel
      ];
    };
  };
}
