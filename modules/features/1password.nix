{ self, inputs, ... }: {
	flake.nixosModules.onePassword = { pkgs, lib, ... }: {
		programs._1password-gui = {
			enable = true;
		};
	};

	# perSystem = { pkgs, lib, self', ... }: {
	# 	packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
	# 		inherit pkgs;
	# 		settings = {
	# 			layout.gaps = 5;
	#
	# 			binds = {
	# 				"Mod+Return".spawn-sh = lib.getExe pkgs.alacritty;
	# 				"Mod+Q".close-window = null;
	# 			};
	# 		};
	# 	};
	# };
}
