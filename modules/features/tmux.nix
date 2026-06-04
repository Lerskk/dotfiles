{ self, inputs, ... }: {
	flake.nixosModules.tmux = { pkgs, lib, ... }: {
		programs.tmux = {
			enable = true;
			package = self.packages.${pkgs.stdenv.hostPlatform.system}.myTmux;
		};
	};
	perSystem = { pkgs, lib, self', ... }: {
		packages.myTmux = inputs.wrapper-modules.wrappers.tmux.wrap {
			inherit pkgs;
					mouse  = true;
					prefix = "C-a";
          modeKeys = "vi";
					configAfter = ''
						bind ^A last-window
					'';
			};
		};
}
