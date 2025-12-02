{
  pkgs,
  lib,
  config,
  ...
}: {
  home.file."./.config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/homeManagerModules/features/nvim/config";


  programs.neovim = {
    enable = true;

    extraPackages = with pkgs; [
      lua-language-server
    ];

  };
}
