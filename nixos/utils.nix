{
  replaceDesktopExec =
    derivation: execStr:
    (derivation.overrideAttrs (oldAttrs: rec {
      desktopItem = oldAttrs.desktopItem.override {
        exec = "${execStr}";
      };
      postInstall =
        builtins.replaceStrings
          [
            "${oldAttrs.desktopItem}"
          ]
          [
            "${desktopItem}"
          ]
          oldAttrs.postInstall;
    }));
}
