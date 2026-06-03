{ self, inputs, ... }: {
	flake.nixosModules.fish = { pkgs, lib, ... }: {
    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];

    environment.systemPackages = with pkgs; [
			self.packages.${pkgs.stdenv.hostPlatform.system}.myAlacritty
    ];
	};

	perSystem = { config, pkgs, lib, self', ... }: {
		packages.myAlacritty = inputs.wrapper-modules.wrappers.alacritty.wrap {
			inherit pkgs;


      settings = {
        env = {
          TERM = "xterm-256color";
        };

        font = {
          size = 11;

          normal = {
            family = "JetBrainsMono Nerd Font";
          };
        };

        cursor = {
          style = {
            shape = "Beam";
            blinking = "Off";
          };
        };

        selection = {
          save_to_clipboard = true;
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
      };
		};
	};
}
