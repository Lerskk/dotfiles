{
  pkgs,
  ...
}: {
  gtk.enable = true;

  gtk.cursorTheme.package = pkgs.bibata-cursors;
  gtk.cursorTheme.name = "Bibata-Modern-Ice";

  gtk.theme.package = pkgs.adw-gtk3;
  gtk.theme.name = "adw-gtk3";

  # gtk.iconTheme.package = ;
  # gtk.icontheme.name = ;
  }
