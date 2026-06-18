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

        # latex setup
        biber
        fd # TODO investigate
        graphviz # TODO investigate
        neovim-remote # inverse search
        texlab
        texliveFull
        tikzit
        zathura
        zathuraPkgs.zathura_pdf_poppler
        zotero # TODO investigate
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
          friendly-snippets
          gitsigns-nvim
          harpoon2
          lazy-nvim
          luasnip
          nvim-autopairs
          nvim-lspconfig
          nvim-spider
          nvim-treesitter
          plenary-nvim
          telescope-nvim
          vimtex
        ];
      };
		};
	};
}

