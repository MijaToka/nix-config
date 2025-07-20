{ pkgs, inputs, stylix, ... }:{
  imports = [
    ./modules
  ];

  home = {
    username = "mija";
    homeDirectory = "/home/mija";
    stateVersion = "25.05";
  };
}