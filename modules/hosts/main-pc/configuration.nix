{ self, inputs, ... }: {
  flake.nixosModules.mainPCConfiguration =  { pkgs, lib, ... }: {
    imports = [
      self.nixosModules.mainPCHardware
      self.nixosModules.niri
      self.nixosModules.tmux
      self.nixosModules.onePassword
      self.nixosModules.nvim
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.networkmanager.enable = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    nixpkgs.config.allowUnfree = true;


    environment.systemPackages = with pkgs; [
      firefox
      git
      tidal-hifi
    ];

    system.stateVersion = "25.11"; # Did you read the comment?
  };
}
