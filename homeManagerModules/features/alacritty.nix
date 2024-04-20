{
  pkgs,
  config,
  ...
}: {
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    colors = {
      bright = {
        black = "0x171717";
        blue = "0x7c89e0";
        cyan = "0x8adeff";
        green = "0xadda71";
        magenta = "0xc894eb";
        red = "0xff5773";
        white = "0xe3e3e3";
        yellow = "0xffcb6b";
      };
      # cursor = {
      #   cursor = "0x171717";
      #   text = "0xe3e3e3";
      # };
      normal = {
        black = "0x171717";
        blue = "0x7c89e0";
        cyan = "0x8adeff";
        green = "0xadda71";
        magenta = "0xc894eb";
        red = "0xff5773";
        white = "0xe3e3e3";
        yellow = "0xffcb6b";
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
