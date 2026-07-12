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

        bind-key ^H run-shell "sesh last"

        set -g status on
        set -g status-position bottom
        set -g status-interval 1
        set -g status-style "bg=default,fg=colour7"

        set -g window-status-format "#[fg=colour8]#I:#W"
        set -g window-status-current-format "#[fg=colour15,bold]#I:#W"
        set -g window-status-separator "   "

        set -g status-left-length 60
        set -g status-left " #[fg=colour4]󰆍 #[fg=colour15]#S #[fg=colour8]│ "

        set -g status-right-length 120
        set -g status-right "#[fg=colour8]│ #[fg=colour4]󰈔 #[fg=colour15]#H #[fg=colour8]│ #[fg=colour2]󰍛 #[fg=colour15]#(free -h | awk '/Mem:/ {print $3}') #[fg=colour8]│ #[fg=colour3]󰥔 #[fg=colour15]%H:%M #[fg=colour8] "
      '';
			};
		};
}
