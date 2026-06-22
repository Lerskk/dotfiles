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

      runtimePkgs = with pkgs; [
        sesh
        fzf
        fd
        zoxide
      ];

      mouse  = true;
      prefix = "C-a";
      modeKeys = "vi";
      configAfter = ''
        bind ^A last-window

        bind-key ^E run-shell "sesh connect \"$(
          sesh list --icons | fzf-tmux -p 80%,70% \
            --no-sort --ansi --border-label ' sesh ' --prompt '⚡  ' \
            --header '  ^a all ^t tmux ^g configs ^x zoxide ^d tmux kill ^f find' \
            --bind 'tab:down,btab:up' \
            --bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list --icons)' \
            --bind 'ctrl-t:change-prompt(🪟  )+reload(sesh list -t --icons)' \
            --bind 'ctrl-g:change-prompt(⚙️  )+reload(sesh list -c --icons)' \
            --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z --icons)' \
            --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
            --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list --icons)' \
            --preview-window 'right:55%' \
            --preview 'sesh preview {}'
        )\""
      '';
			};
		};
}
