{
  ...
}: {
  programs.zathura = {
    enable = true;

    options = {
      # font = "Tahoma Normal 12";

      selection-clipboard = "clipboard";
      adjust-open = "width";
      default-bg = "rgba(0,0,0,0.8)";
      recolor = true;
      recolor-lightcolor = "rgba(0,0,0,0)";
      recolor-keephue = true;

      zoom-center = true;
      zoom-min = "100";
      zoom-step = "5";

      statusbar-bg = "rgba(0,0,0,0;)";
      statusbar-fg = "rgba(255,255,255,255)";
      statusbar-basename = true;
      statusbar-h-padding = 20;
      statusbar-v-padding = 20;
      statusbar-home-tilde = true;
      statusbar-page-percent = true;
    };
  };
}
