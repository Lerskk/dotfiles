{
  pkgs,
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
    myHomeManager.ags.enable = lib.mkDefault true;
    myHomeManager.alacritty.enable = lib.mkDefault true;
    myHomeManager.gtk.enable = lib.mkDefault true;
    myHomeManager.hyprland.enable = lib.mkDefault true;
    myHomeManager.tmux.enable = lib.mkDefault true;
    myHomeManager.wlogout.enable = lib.mkDefault true;
    myHomeManager.xdg.enable = lib.mkDefault true;
    myHomeManager.zathura.enable = lib.mkDefault true;

    qt.enable = true;
    qt.platformTheme = "gtk";
    qt.style.name = "adwaita-dark";

    home.sessionVariables = {
      QT_STYLE_OVERRIDE = "adwaita-dark";
      XDG_CURRENT_DESKTOP = "Sway";
    };

    home.packages = with pkgs; [
      adwaita-qt
      alacritty
      dolphin
      # davinci-resolve
      flameshot
      geeqie
      gimp
      hyprlock
      hyprpicker
      inkscape
      krita
      obs-studio
      opentabletdriver
      playerctl
      rofi-wayland
      scrcpy
      spotify
      sway-contrib.grimshot
      xfce.thunar
      ventoy
      vlc
      wlogout
      # xdg-desktop-portal-hyprland
      zathura
    ];
  };

}
