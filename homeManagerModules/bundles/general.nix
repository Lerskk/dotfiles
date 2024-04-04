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

  nixpkgs = {
    config = {
      allowUnfree = true;
      experimental-features = "nix-command flakes";
    };
  };

  home.packages = with pkgs; [
    bat
    eza
    fzf
    htop
    killall
    neofetch
    starship
    ripgrep
    unzip
    wget
    zip
  ];
}
