{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles.lerskk = {
      settings = {
        "dom.security.https_only_mode" = true;
        "browser.dowloand.panel.shown" = true;
        "identity.fxacconts.enabled" = false;
        "signon.rememberSignons" = false;
      };

      search.engines = {
        "Nix Packages" = {
          urls = [{
            template = "https://mynixos.com/search";
            params = [
            { name = "query"; value = "{searchTerms}";}
            ];
          }];

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
        };
      };
      search.force = true;

      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        onepassword-password-manager
      ];

      userChrome = ''
        /* some css */
      '';

      languagePacks = [ "en-GB" "es-AR"];
    };
  };
}
