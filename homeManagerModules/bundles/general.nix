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
    clang
    eza
    fzf
    killall
    fastfetch
    ripgrep
    starship
    tmux
    unzip
    wget
    zip
  ];
}
