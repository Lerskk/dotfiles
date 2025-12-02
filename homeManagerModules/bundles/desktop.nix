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
    myHomeManager.qutebrowser.enable = lib.mkDefault true;
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
      _1password-cli
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
      rofi
      scrcpy
      spotify
      sway-contrib.grimshot
      vlc
      wlogout
      # xdg-desktop-portal-hyprland
      zathura

      vesktop
      vencord
      libxkbcommon   
      dunst
      hyprpaper
      firefox
      inputs.zen-browser.packages.${pkgs.stdenv.system}.twilight
      tldr
      xfce.thunar
      nvitop
      ffmpeg
      slurp
      syncthing
      gnugrep
      gnumake
      telegram-desktop
      tidal-hifi
      cmake
      xdg-desktop-portal-hyprland
      webcord
      wget
    ];
  };

}
