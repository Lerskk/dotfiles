{ self, inputs, ... }: {
	flake.nixosModules.fish = { pkgs, lib, ... }: {
		programs.fish = {
			enable = true;
			package = self.packages.${pkgs.stdenv.hostPlatform.system}.myFish;
		};
	};

	perSystem = { pkgs, lib, self', ... }: {
		packages.myFish = inputs.wrapper-modules.wrappers.fish.wrap {
			inherit pkgs;

      extraPackages = with pkgs; [
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


      plugins = [
        pkgs.fishPlugins.fzf-fish
      ];

		};
	};
}
