{ self, inputs, ... }: {
	flake.nixosModules.niri = { pkgs, lib, ... }: {
		programs.niri = {
			enable = true;
			package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
		};
	};

	perSystem = { pkgs, lib, self', ... }: {
		packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
			inherit pkgs;
			settings = {
				xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

				layout.gaps = 5;

				binds = {
					"Mod+Return".spawn-sh = lib.getExe pkgs.alacritty;
					"Mod+Q".close-window = {};
				};

				outputs = {
					"HDMI-A-2" = {
						mode = "2560x1440@360";
					};
				};
			};
		};
	};
}
