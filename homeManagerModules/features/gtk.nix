{
  pkgs,
  ...
}: {
  gtk.enable = true;

  gtk.theme.package = pkgs.adw-gtk3;
  gtk.theme.name = "adw-gtk3";

  # gtk.iconTheme.package = ;
  # gtk.icontheme.name = ;
  }
