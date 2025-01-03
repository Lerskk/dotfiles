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
      inputs.ags.packages.${pkgs.system}.hyprland
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
