{
  inputs,
  pkgs,
  ...
}: {
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    configDir = ./config;
    
    extraPackages = with pkgs; [
      accountsservice
      gtksourceview
      sass
      webkitgtk
    ];
  };

  home.packages = with pkgs; [
    sass
  ];
}
