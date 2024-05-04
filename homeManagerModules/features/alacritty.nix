{
  pkgs,
  config,
  ...
}: {
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    env = {
      TERM = "xterm-256color";
    };
    
    colors = {
      cursor = {
        cursor = "0xf5e0dc";
        text = "0x1e1e2e";
      };
      vi_mode_cursor = {
        cursor = "#b4befe";
        text = "#1e1e2e";
      };

      primary = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        dim_foreground = "#7f849c";
        bright_foreground = "#cdd6f4";
      };
      normal = {
        black = "#45475a";
        red = "#f38ba8";
        green = "#a6e3a1";
        yellow = "#f9e2af";
        blue = "#89b4fa";
        magenta = "#f5c2e7";
        cyan = "#94e2d5";
        white = "#bac2de";
      };
      bright = {
        black = "#585b70";
        red = "#f38ba8";
        green = "#a6e3a1";
        yellow = "#f9e2af";
        blue = "#89b4fa";
        magenta = "#f5c2e7";
        cyan = "#94e2d5";
        white = "#a6adc8";
      };
      dim = {
        black = "#45475a";
        red = "#f38ba8";
        green = "#a6e3a1";
        yellow = "#f9e2af";
        blue = "#89b4fa";
        magenta = "#f5c2e7";
        cyan = "#94e2d5";
        white = "#bac2de";
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
