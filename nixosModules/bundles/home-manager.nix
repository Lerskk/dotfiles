{
  inputs,
  outputs,
  config,
  lib,
  myLib,
  ...
}: let
  cfg = config.myNixOS;
in {
  options.myNixOS = {
    userName = "lerskk";

    userConfig = lib.mkOption {
      default = ./../../hosts/desktop/home.nix;
      description = ''
        home-manager config path
      '';
    };
  };

  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      extraSpecialArgs = {
        inherit inputs;
        inherit myLib;
        outputs = inputs.self.outputs;
      };
      users = {
        ${cfg.userName} = {...}: {
          imports = [
            (import cfg.userConfig)
            outputs.homeManagerModules.default
          ];
        };
      };
    };
  };

}
