{
  pkgs,
  ...
}: {
  home.file.".config/nvim" = {
    source = ./config;
    recursive = true;
  };


  programs.neovim = {
    enable = true;

    extraPackages = with pkgs; [
      libclang
      lua-language-server
      gcc
      clang
      clang-tools
      nodePackages."@prisma/language-server"
      nodePackages."@tailwindcss/language-server"
      nodePackages.typescript-language-server
      nodePackages.vscode-css-languageserver-bin
      texlab
      vscode-langservers-extracted
    ];
  };
}
