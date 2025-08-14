{
  inputs,
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
    qt.platformTheme.name = "gtk";
    qt.style.name = "adwaita-dark";

    home.sessionVariables = {
      QT_STYLE_OVERRIDE = "adwaita-dark";
      XDG_CURRENT_DESKTOP = "Sway";
    };

    home.packages = with pkgs; [
      adwaita-qt
      alacritty
      audacity
      flameshot
      geeqie
      gimp
      google-chrome
      hypridle
      hyprlock
      hyprpicker
      inkscape
      krita
      libreoffice
      nh
      nix-output-monitor
      obs-studio
      obsidian
      opentabletdriver
      playerctl
      qelectrotech
      rofi-wayland
      scrcpy
      spotify
      sway-contrib.grimshot
      texliveFull
      xfce.thunar
      vlc
      wlogout
      # xdg-desktop-portal-hyprland
      zathura

      vesktop
      libxkbcommon   
      dunst
      swww
      firefox
      tldr
      xfce.thunar
      rofi-wayland
      nvitop
      ffmpeg
      syncthing
      gnugrep
      gnumake
      telegram-desktop
      cmake
      kdePackages.xwaylandvideobridge
      wget
    ];
  };

}
