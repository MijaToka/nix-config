{ inputs, ... }: {
  flake.nixosModules.kineticWE = {
    imports = [ inputs.kineticwe.nixosModules.default ];
    programs.kineticwe.enable = true;
  };
}
