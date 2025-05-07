{
  inputs,
  config,
  lib,
  myLib,
  ...
}: let
  cfg = config.myNixOS;

  bundles =
  myLib.extendModules
  (name: {
    extraOptions = {
      myNixOS.bundles.${name}.enable = lib.mkEnableOption "enable ${name} module bundle";
    };

    configExtension = config: (lib.mkIf cfg.bundles.${name}.enable config);
  })
  (myLib.filesIn ./bundles);

  features =
  myLib.extendModules
  (name: {
    extraOptions = {
      myNixOS.features.${name}.enable = lib.mkEnableOption "enable ${name} module bundle";
    };

    configExtension = config: (lib.mkIf cfg.features.${name}.enable config);
  })
  (myLib.filesIn ./features);

in {
  imports = 
    [ inputs.home-manager.nixosModules.home-manager ]
    ++ bundles
    ++ features;
}


