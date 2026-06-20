{ self, ... }: {
  flake.nixosModules.mainPCConfiguration =  { pkgs, ... }: {
    imports = [
      self.nixosModules.mainPCHardware

      self.nixosModules.alacritty
      self.nixosModules.ghostty
      self.nixosModules.niri
      self.nixosModules.tmux
      self.nixosModules.onePassword
      self.nixosModules.nvim
      self.nixosModules.fish
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.networkmanager.enable = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;

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
      spotify
      telegram-desktop
      thunar
      tuxedo
      vesktop

      # university
      logisim
    ];

    services.syncthing = {
      enable = true;
      openDefaultPorts = true;
      user = "lerskk";
      dataDir = "/home/lerskk";
    };

    system.stateVersion = "25.11"; # Did you read the comment?
  };
}
