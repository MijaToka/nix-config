{
  self,
  ...
}:
{
  flake = {
    nixosModules.niri = {

      imports = with self.nixosModules; [ noctalia ];

      programs = {
        niri = {
          enable = true;
        };
      };
    };
  };
}
