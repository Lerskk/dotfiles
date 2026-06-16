{ self, inputs, ... }: {
	flake.nixosModules.nvim = { pkgs, ... }: {
		programs.neovim = {
			enable = true;
			package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNvim;
		};
	};

	perSystem = { pkgs, ... }: {
		packages.myNvim = inputs.wrapper-modules.wrappers.neovim.wrap {
			inherit pkgs;

      runtimePkgs = with pkgs; [
        ripgrep

        lua-language-server
        nixd

        tree-sitter
        clang
        curl
      ];

      settings = {
        config_directory = ./config/nvim;

        extraPackages = with pkgs; [
          wl-clipboard
        ];
      };

      specs = {
        general = with pkgs.vimPlugins; [
          blink-cmp
          blink-indent
          catppuccin-nvim
          gitsigns-nvim
          harpoon2
          lazy-nvim
          nvim-autopairs
          nvim-lspconfig
          nvim-spider
          nvim-treesitter
          plenary-nvim
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

