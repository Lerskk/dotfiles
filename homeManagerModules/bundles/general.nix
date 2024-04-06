{
  pkgs,
  ...
}: {
  nixpkgs = {
    config = {
      allowUnfree = true;
      experimental-features = "nix-command flakes";
    };
  };


  home.packages = with pkgs; [
    age
    bat
    btop
    cargo
    eza
    fzf
    killall
    neofetch
    ripgrep
    starship
    syncthing
    unzip
    wget
    zip
  ];
}
