{ self, inputs, ... }: {
	flake.nixosModules.fish = { pkgs, lib, ... }: {
    programs.starship.enable = true;
		programs.fish = {
			enable = true;
			package = self.packages.${pkgs.stdenv.hostPlatform.system}.myFish;
		};
	};

	perSystem = { pkgs, lib, self', ... }: {
		packages.myFish = inputs.wrapper-modules.wrappers.fish.wrap {
			inherit pkgs;

      runtimePkgs = with pkgs; [
        eza
        trash-cli
      ];

      abbreviations = {
        ls = "eza -alhg";
        ll = "eza -lg";
        lt = "eza -aT --git-ignore";
        rm = "trash";
        cp = "cp -i";
        mv = "mv -i";
        mkdir = "mkdir -p";
        less = "less -MNi";
        v = "nvim";

        gs = "git status";
        gl = "git log --oneline";
        gc = "git commit -m";
        gca = "git commit -am";
        gac = "git add --all && git commit -m";
        gco = "git checkout";
        gd = "git diff";
        gp = "git push";
        gst = "git stash save -u";
        gstp = "git stash pop";
        gstl = "git stash list";
      };

      configFile.content = ''
        fish_vi_key_bindings

        starship init fish | source
      '';

      plugins = with pkgs.fishPlugins; [
        fzf
      ];

		};
	};
}
