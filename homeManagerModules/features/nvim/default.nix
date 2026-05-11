{
  pkgs,
  lib,
  config,
  ...
}: {
  home.file."./.config/nvim" = {
    source = ./config;
    recursive = true;
  };

  programs.neovim = {
    enable = true;

    extraPackages = with pkgs; [
      lua-language-server
    ];

  };
}
