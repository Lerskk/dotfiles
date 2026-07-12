{ self, inputs, ... }: {
	flake.nixosModules.thunar = { pkgs, ... }: {
		environment.systemPackages = with pkgs.xfce; [
			thunar-volman
		];

		programs.thunar = {
			enable = true;
			plugins = with pkgs.xfce; [
				thunar-archive-plugin
			];
		};

		services.udisks2.enable = true;
		services.gvfs.enable = true;
	};
}
