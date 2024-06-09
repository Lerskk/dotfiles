{
  ...
}: {
  home.file.".config/fish" = {
    source = ./config;
    recursive = true;
  };
}
