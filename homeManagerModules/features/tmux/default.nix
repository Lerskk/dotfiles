{
  ...
}: {
  home.file.".config/tmux" = {
    source = ./config;
    recursive = true;
  };
}
