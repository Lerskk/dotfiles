
{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  myNixOS = {
    bundles.users.enable = true;

    home-users = {
      "lerskk" = {
        userConfig = ./home.nix;
      };
    };
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Argentina/Cordoba";

  fonts.packages = with pkgs; [
    corefonts
    (google-fonts.override { fonts = [ "Nunito" ]; })
    nerd-fonts.fira-code
  ];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
  };

  # Enable OpenGL
  hardware.opengl = {
    enable = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    
    powerManagement.enable = false;

    powerManagement.finegrained = false;

    open = false;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vesktop
    webcord
    ladybird
    discord-screenaudio
    python310
    gcc
    python310Packages.tox
    python310Packages.xkbcommon 
    python310Packages.evdev
    libxkbcommon   
    eww
    dunst
    swww
    firefox
    fish
    pfetch
    tldr
    eza
    trash-cli
    xfce.thunar
    unzip
    rofi-wayland
    zip
    wl-clipboard
    ripgrep
    bat
    exiftool
    nvitop
    ffmpeg
    syncthing
    gvfs
    chezmoi
    fzf
    git
    gnugrep
    nodejs_20
    gnumake
    telegram-desktop
    cmake
    wget
  ];

  programs.xfconf.enable = true;
  programs.thunar = {
    enable = true;

    plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
    ];
  };

  services.gvfs.enable = true;
  services.tumbler.enable = true;

  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  
  programs.hyprland = {
    enable = true;
  };


  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";

    NIXOS_OZONE_WL = "1";
  };
  
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "lerskk" ];
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
