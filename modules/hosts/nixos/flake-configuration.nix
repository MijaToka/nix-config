{
  self,
  inputs,
  ...
}:
{
  flake.nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      {
        nixpkgs.hostPlatform.system = "x86_64-linux";
        networking.hostName = "nixos";
        system.stateVersion = "25.05";
      }
      ./_hardware-configuration.nix

      desktopModuleBundle
      { }

      gamingModuleBundle
      { gaming.osu.enable = true; }

      users
      powerKey
      customServices
      gpuDrivers
    ];
  };
}
