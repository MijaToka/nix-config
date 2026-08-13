{ inputs, ... }: {
  systems = [ "x86_64-linux" ];
  imports = [ inputs.wrapper-modules.flakeModules.wrappers ];
}
