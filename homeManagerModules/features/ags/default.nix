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
      webkitgtk_6_0
    ];
  };

  home.packages = with pkgs; [
    sass
  ];
}
