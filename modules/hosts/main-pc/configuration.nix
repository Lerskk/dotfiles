{ self, ... }: {
  flake.nixosModules.mainPCConfiguration =  { pkgs, ... }: {
    imports = [
      self.nixosModules.mainPCHardware

      self.nixosModules.alacritty
      self.nixosModules.ghostty
      self.nixosModules.niri
      self.nixosModules.tmux
      self.nixosModules.opencode
      self.nixosModules.onePassword
      self.nixosModules.nvim
      self.nixosModules.fish
      self.nixosModules.thunar
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.networkmanager.enable = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;

    time.timeZone = "America/Argentina/Cordoba";

    users.users.lerskk = {
      isNormalUser = true;

      extraGroups = [
        "wheel"
        "networkmanager"
      ];
      shell = self.packages.${pkgs.stdenv.hostPlatform.system}.myFish;
    };

    environment.systemPackages = with pkgs; [
      opentabletdriver
			self.packages.${pkgs.stdenv.hostPlatform.system}.myAlacritty
      darktable
      firefox
      git
      (symlinkJoin {
        name = "tidal-hifi-fixed";
        paths = [ tidal-hifi ];

        buildInputs = [ makeWrapper ];

        postBuild = ''
          wrapProgram $out/bin/tidal-hifi \
            --add-flags "--disable-dev-shm-usage"
        '';
      })
      zathura
      jujutsu
      spotify
      telegram-desktop
      obs-studio
      tuxedo
      vesktop
      hyprpicker
      wl-clipboard

      # node + package managers
      nodejs_22
      nodejs_24
      nodejs_latest
      pnpm

      # university
      logisim
    ];

    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      wireplumber.enable = true;
    };

    xdg.portal = {
      config.niri = {
        default = ["gnome" "gtk"];
        "org.freedesktop.impl.portal.Access" = "gtk";
        "org.freedesktop.impl.portal.Notification" = "gtk";
        "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
        "org.freedesktop.impl.portal.FileChooser" = "gtk";
        "org.freedesktop.impl.portal.ScreenCast" = "gnome";
        "org.freedesktop.portal.ScreenCast" = "gnome";
      };
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
      ];
    };


    hardware.opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };

    services.syncthing = {
      enable = true;
      openDefaultPorts = true;
      user = "lerskk";
      dataDir = "/home/lerskk";
    };

    system.stateVersion = "25.11"; # Did you read the comment?
  };
}
