{ self, inputs, lib, ... }: {
	flake.nixosModules.nvim = { pkgs, ... }: {
    environment.sessionVariables = {
      EDITOR = "nvim";
    };
		programs.neovim = {

			enable = true;
			package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNvim;
		};
	};

		perSystem = { pkgs, ... }: {
			packages.myNvim = let
				undotree-vim = pkgs.vimUtils.buildVimPlugin {
					name = "undotree-vim";
					src = inputs.undotree;
				};

        formoun = pkgs.vimUtils.buildVimPlugin {
        name = "formoun";
        src = inputs.formoun;
        };

			in inputs.wrapper-modules.wrappers.neovim.wrap {
      inherit pkgs;

      runtimePkgs = with pkgs; [
        ripgrep

        lua-language-server
        nixd
        typescript-language-server
        prisma-language-server

        tree-sitter
        clang
        curl
        ltex-ls-plus

        # formatters
        prettierd

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
        general = [
          undotree-vim
          formoun
        ] ++ (with pkgs.vimPlugins; [
          blink-cmp
          blink-indent
          catppuccin-nvim
          conform-nvim
          friendly-snippets
          gitsigns-nvim
          harpoon2
          lazy-nvim
          luasnip
          oil-nvim
          mini-base16
          nvim-surround
          nvim-autopairs
          nvim-lspconfig
          nvim-spider
          nvim-treesitter
          plenary-nvim
          telescope-nvim
          vim-matchup
          nvim-ts-autotag
          trouble-nvim
          vimtex
        ]);
      };
		};
	};
}

