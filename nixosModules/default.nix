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

in {
  imports = 
    [ inputs.home-manager.nixosModules.home-manager ]
    ++ bundles;
    # ++ features;

  config = {
    nix.settings.experimental-features = ["nix-command" "flakes"];
    nixpkgs.config.allowUnfree = true;
  };
}


