{
  pkgs,
  config,
  ...
}: {
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    colors = {
      bright = {
        black = "0x262626";
        blue = "0x748be9";
        cyan = "0x99e0ee";
        green = "0x99d92b";
        magenta = "0xc098fb";
        red = "0xf75a64";
        white = "0xe3e3e3";
        yellow = "0xffcf10";
      };
      # cursor = {
      #   cursor = "0x171717";
      #   text = "0xe3e3e3";
      # };
      normal = {
        black = "0x111111";
        blue = "0x5571d4";
        cyan = "0x7cc4d2";
        green = "0x84bb24";
        magenta = "0xaf73f9";
        red = "0xe72338";
        white = "0xe3e3e3";
        yellow = "0xefc200";
      };
      primary = {
        background = "0x171717";
        foreground = "0xe3e3e3";
      };
    };
    shell.program = "fish";
    font = {
      bold = {
        family = "JetBrainsMono Nerd Font";
        style = "Bold";
      };
      bold_italic = {
        family = "JetBrainsMono Nerd Font";
        style = "Bold Italic";
      };
      italic = {
        family = "JetBrainsMono Nerd Font";
        style = "Italic";
      };
      normal = {
        family = "JetBrainsMono Nerd Font";
        style = "Regular";
      };
      size = 12;
    };
    window = {opacity = 0.95;};
  };
}
