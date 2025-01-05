{
  pkgs,
  lib,
  ...
}: {
  home.file.".config/nvim" = {
    source = ./config;
    recursive = true;
  };


  programs.neovim = {
    enable = true;

    extraPackages = with pkgs; [
      lua-language-server
      gcc
      clang-tools
      clang
      libclang
      ltex-ls
      # nodePackages."@prisma/language-server"
      # nodePackages."@tailwindcss/language-server"
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      pyright
      texlab
      vscode-langservers-extracted
    ];

  };
}
