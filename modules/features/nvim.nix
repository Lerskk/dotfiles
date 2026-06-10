{ self, inputs, ... }: {
	flake.nixosModules.nvim = { pkgs, lib, ... }: {
		programs.neovim = {
			enable = true;
			package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNvim;
		};
	};

	perSystem = { config, pkgs, lib, self', ... }: {
		packages.myNvim = inputs.wrapper-modules.wrappers.neovim.wrap {
			inherit pkgs;

      runtimePkgs = with pkgs; [
        ripgrep
      ];

      settings = {
        config_directory = ./config/nvim;

        extraPackages = with pkgs; [
          wl-clipboard
        ];
      };

      specs = {
        general = with pkgs.vimPlugins; [
          lazy-nvim
          telescope-nvim
        ];

        lazy = {
          lazy = true;

          data = with pkgs.vimPlugins; [
          ];
        };
      };
		};
	};
}

