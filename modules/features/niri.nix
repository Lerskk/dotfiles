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

        workspaces = {
          "browser" = {};
          "work" = {};
          "filler" = {};
          "multimedia" = {
            open-on-output = "DP-4";
          };
        };

				binds = {
          "Mod+H".focus-column-left = {};
          "Mod+L".focus-column-right = {};
          "Mod+J".focus-window-down = {};
          "Mod+K".focus-window-up = {};

          "Mod+Shift+H".move-column-left = {};
          "Mod+Shift+L".move-column-right = {};

          "Mod+Ctrl+H".set-column-width = "-5%";
          "Mod+Ctrl+L".set-column-width = "+5%";
          "Mod+Ctrl+J".set-window-height = "+5%";
          "Mod+Ctrl+K".set-window-height = "-5%";

          "Mod+C".center-column = {};

          "Mod+U".focus-workspace-up = {};
          "Mod+D".focus-workspace-down = {};
          "Mod+W".focus-monitor-right = {};
          "Mod+B".focus-monitor-left = {};

          "Mod+Shift+U".move-window-to-workspace-up = {};
          "Mod+Shift+D".move-window-to-workspace-down = {};
          "Mod+Shift+W".move-window-to-monitor-right = {};
          "Mod+Shift+B".move-window-to-monitor-left = {};

          "Mod+Ctrl+W".move-workspace-to-monitor-right = {};
          "Mod+Ctrl+B".move-workspace-to-monitor-left = {};

					"Mod+Q".close-window = {};
          "Mod+M".maximize-column = {};
          "Mod+Shift+F".fullscreen-window = {};
          "Mod+T".toggle-window-floating = {};

					"Alt+Space".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";
					"Mod+Return".spawn-sh = "${lib.getExe self'.packages.myAlacritty}";

          "Mod+Ctrl+S".spawn-sh = "${lib.getExe pkgs.grim} -l 0 - | ${pkgs.wl-clipboard}/bin/wl-copy";
          "Mod+Shift+E".spawn-sh = "${pkgs.wl-clipboard}/bin/wl-paste | ${lib.getExe pkgs.swappy} -f -";

          "XF86AudioPrev".spawn-sh = "${lib.getExe pkgs.playerctl} previous";
          "XF86AudioPlay".spawn-sh = "${lib.getExe pkgs.playerctl} play-pause";
          "XF86AudioNext".spawn-sh = "${lib.getExe pkgs.playerctl} next";
          "XF86AudioRaiseVolume".spawn-sh = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+";
          "XF86AudioLowerVolume".spawn-sh = "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-";
          "XF86AudioMute".spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "Mod+Ctrl+M".spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
				};

        window-rules = [
          {
            matches = [ 
              { app-id = "vesktop"; }
              { app-id = "telegram-desktop"; }
              { app-id = "tidal-hifi"; }
            ];
            open-on-workspace = "multimedia";
          }
        ];

				outputs = {
					"HDMI-A-2" = {
						mode = "2560x1440@119.998";
            position = _: {
              props = {
                x= 0;
                y= 0;
              };
            };
					};
          "DP-4" = {
            mode = "2560x1440@99.946";
            position = _: {
              props = {
                x= -2560;
                y= 0;
              };
            };
          };
				};
			};
		};
	};
}
