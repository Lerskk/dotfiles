{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.qutebrowser = {
    enable = true;

    extraConfig = ''
      config.bind(",,", "spawn --userscript qute-1pass")
      config.bind(",p", "spawn --userscript qute-1pass --password")
      config.bind(",u", "spawn --userscript qute-1pass --username")
    '';
  };
}
