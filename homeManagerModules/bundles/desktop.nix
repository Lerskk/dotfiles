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
    myHomeManager.cursor.enable = lib.mkDefault true;
    myHomeManager.fish.enable = lib.mkDefault true;
    myHomeManager.gtk.enable = lib.mkDefault true;
    myHomeManager.hyprland.enable = lib.mkDefault true;
    myHomeManager.nvim.enable = lib.mkDefault true;
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
      audacity
      dolphin
      # davinci-resolve
      flameshot
      geeqie
      gimp
      google-chrome
      hyprlock
      hyprpicker
      inkscape
      kdenlive
      krita
      libreoffice
      nh
      nix-output-monitor
      # neovim
      obs-studio
      obsidian
      opentabletdriver
      playerctl
      psensor
      pureref
      qelectrotech
      rofi-wayland
      scrcpy
      spotify
      sway-contrib.grimshot
      texliveFull
      xfce.thunar
      ventoy
      vlc
      wlogout
      # xdg-desktop-portal-hyprland
      zathura
    ];
  };

}
