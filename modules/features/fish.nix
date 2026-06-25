{ self, inputs, ... }: {
	flake.nixosModules.fish = { pkgs, lib, ... }: {
    programs.starship.enable = true;

		programs.fish = {
			enable = true;
			package = self.packages.${pkgs.stdenv.hostPlatform.system}.myFish;
		};
	};

	perSystem = { pkgs, ... }: {
		packages.myFish = inputs.wrapper-modules.wrappers.fish.wrap {
			inherit pkgs;

      runtimePkgs = with pkgs; [
        eza
        trash-cli
        fzf
        fd
        bat
        sesh
        zoxide
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

      flags."--no-config" = false; # fish update enabling private mode when --no-config is used. remove when fixed

      configFile.content = ''
        fish_vi_key_bindings
        fish_clipboard_copy

        zoxide init fish | source
        starship init fish | source
      '';

      plugins = with pkgs.fishPlugins; [
        fzf
      ];

		};
	};
}
