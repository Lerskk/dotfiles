{ self, inputs, ... }: {
	perSystem = { pkgs, ... }: {
		packages.myNoctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
			settings = {};
		};
	};
}
