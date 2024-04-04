{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  options = {
    myHomeManager.startupScript = lib.mkOption {
      default = "";
      description = ''
        Startup scirpt
      '';
    };
  };

  config = {
    myHomeManager.alacritty.enable = lib.mkDefault true;
    # myHomeManager.blender.enable = lib.mkDefault true;
    # myHomeManager.zathura.enable = lib.mkDefault true;
    # myHomeManager.rofi-wayland.enable = lib.mkDefault true;

    home.packages = with pkgs; [
      alacritty
      rofi-wayland
      zathura
    ];
  };

}
