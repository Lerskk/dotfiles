{
  config,
  ...
}: {
  xdg.enable = true;

  xdg.mimeApps.defaultApplications = {
    "text/plain" = ["nvim.desktop"];
    "application/pdf" = ["zathura.desktop"];
    "image/*" = ["geeqie.desktop"];
    "video/png" = ["vlc.desktop"];
    "video/jpg" = ["vlc.desktop"];
    "video/*" = ["vlc.desktop"];
  };
  
  xdg.userDirs.enable = true;
  xdg.userDirs.createDirectories = true;

  xdg.userDirs.documents = "${config.home.homeDirectory}/documents";
  xdg.userDirs.download = "${config.home.homeDirectory}/downloads";
  xdg.userDirs.music = "${config.home.homeDirectory}/music";
  xdg.userDirs.pictures = "${config.home.homeDirectory}/pictures";
  xdg.userDirs.videos = "${config.home.homeDirectory}/videos";
}
