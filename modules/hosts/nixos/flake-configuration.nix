{
  self,
  withSystem,
  inputs,
  ...
}:
{
  flake.nixosConfigurations.nixos = withSystem "x86_64-linux" (
    { system, ... }:
    inputs.nixpkgs.lib.nixosSystem {
      modules = with self.nixosModules; [
        {
          nixpkgs.hostPlatform = { inherit system; };
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
        nix-ld
      ];
    }
  );
}
