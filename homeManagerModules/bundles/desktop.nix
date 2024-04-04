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

    qt.enable = true;
    qt.platformTheme = "gtk";
    qt.style.name = "adwaita-dark";

    home.sessionVariables = {
      QT_STYLE_OVERRIDE = "adwaita-dark";
    };

    home.packages = with pkgs; [
      adwaita-qt
      alacritty
      flameshot
      gimp
      rofi-wayland
      spotify
      zathura
    ];
  };

}
