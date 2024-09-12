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
    fastfetch
    ripgrep
    SDL2
    starship
    tmux
    unzip
    wget
    zip
  ];
}
