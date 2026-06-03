{ self, inputs, ... }: {
	flake.nixosModules.niri = { pkgs, lib, ... }: {
		programs.niri = {
			enable = true;
			package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
		};
	};

	perSystem = { config, pkgs, lib, self', ... }: {
		packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
			inherit pkgs;
			settings = {
        spawn-at-startup = [
          (lib.getExe self'.packages.myNoctalia)
          (lib.getExe pkgs.vesktop)
          (lib.getExe pkgs.telegram-desktop)
        ];

        input = {
          keyboard = {
            repeat-rate = 40;
            repeat-delay = 250;
          };

          focus-follows-mouse = {};
          mouse.accel-profile = "flat";
        };

				xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

				layout.gaps = 5;

				binds = {
          "Mod+H".focus-column-left = {};
          "Mod+L".focus-column-right = {};
          "Mod+J".focus-window-down = {};
          "Mod+K".focus-window-up = {};
          "Mod+C".center-column = {};

          "Mod+Shift+H".set-column-width = "-5%";
          "Mod+Shift+L".set-column-width = "+5%";
          "Mod+Shift+J".set-window-height = "+5%";
          "Mod+Shift+K".set-window-height = "-5%";

					"Mod+Q".close-window = {};
          "Mod+F".maximize-column = {};
          "Mod+Shift+F".fullscreen-window = {};
          "Mod+T".toggle-window-floating = {};

          "Mod+1".focus-workspace = "0";
          "Mod+2".focus-workspace = "1";
          "Mod+3".focus-workspace = "2";
          "Mod+4".focus-workspace = "3";
          "Mod+5".focus-workspace = "4";

          "Mod+Shift+1".move-column-to-workspace = "0";
          "Mod+Shift+2".move-column-to-workspace = "1";
          "Mod+Shift+3".move-column-to-workspace = "2";
          "Mod+Shift+4".move-column-to-workspace = "3";
          "Mod+Shift+5".move-column-to-workspace = "4";


					"Alt+Space".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";
					"Mod+Return".spawn-sh = "${lib.getExe self'.packages.myAlacritty}";

          "Mod+Ctrl+S".spawn-sh = "${lib.getExe pkgs.grim} -l 0 - | ${pkgs.wl-clipboard}/bin/wl-copy";
          "Mod+Shift+E".spawn-sh = "${pkgs.wl-clipboard}/bin/wl-paste | ${lib.getExe pkgs.swappy} -f -";

          "XF86AudioRaiseVolume".spawn-sh = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+";
          "XF86AudioLowerVolume".spawn-sh = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-";
				};

        window-rules = [
          {
            matches = [ 
              { app-id = "vesktop"; }
              { app-id = "telegram-desktop"; }
              { app-id = "tidal-hifi"; }
            ];
            open-on-workspace = "5";
          }
        ];

				outputs = {
					"HDMI-A-2" = {
						mode = "2560x1440@119.998";
					};
				};
			};
		};
	};
}
