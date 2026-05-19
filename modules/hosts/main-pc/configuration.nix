{ self, inputs, ... }: {
  flake.nixosModules.mainPCConfiguration =  { pkgs, lib, ... }: {
    imports = [
      self.nixosModules.mainPCHardware
      self.nixosModules.niri
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.networkmanager.enable = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    environment.systemPackages = with pkgs; [
      firefox
      neovim
      git
      tmux
    ];

    system.stateVersion = "25.11"; # Did you read the comment?
  };
}
