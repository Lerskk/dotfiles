{
  pkgs,
  ...
}: {
  home.file.".config/tmux" = {
    source = ./config;
    recursive = true;
  };
  programs.tmux = {
    enable = true;
    mouse = true;

    # terminal = "screen-256color";

    prefix = "C-a";
    keyMode = "vi";

    sensibleOnTop = true;

    plugins = with pkgs; [
      tmuxPlugins.catppuccin
      tmuxPlugins.yank
      { 
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-vim 'session'
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'

          # Taken from: https://github.com/p3t33/nixos_flake/blob/5a989e5af403b4efe296be6f39ffe6d5d440d6d6/home/modules/tmux.nix
          # This three lines are specific to NixOS and they are intended
          # to edit the tmux_resurrect_* files that are created when tmux
          # session is saved using the tmux-resurrect plugin. Without going
          # into too much details the strings that are saved for some applications
          # such as nvim, vim, man... when using NixOS, appimage, asdf-vm into the
          # tmux_resurrect_* files can't be parsed and restored. This addition
          # makes sure to fix the tmux_resurrect_* files so they can be parsed by
          # the tmux-resurrect plugin and successfully restored.
          resurrect_dir="$HOME/.tmux/resurrect"
          set -g @resurrect-dir $resurrect_dir
          set -g @resurrect-hook-post-save-all 'target=$(readlink -f $resurrect_dir/last); sed "s| --cmd .*-vim-pack-dir||g; s|/etc/profiles/per-user/$USER/bin/||g; s|/home/$USER/.nix-profile/bin/||g" $target | sponge $target'
        '';
      }
      # { 
      #   plugin = tmuxPlugins.continuum;
      #   extraConfig = ''
      #     set -g @continuum-restore 'on'
      #   '';
      # }
    ];

    shell = "${pkgs.fish}/bin/fish";

    extraConfig = "
      set -g default-terminal \"tmux-256color\"
      set -ag terminal-overrides \",xterm-256color:RGB\"

      set -s escape-time 0

      bind ^X lock-server
      bind ^C new-window -c \"$HOME\"
      bind ^D detach
      bind * list-clients

      bind H previous-window
      bind L next-window

      bind ^A last-window
      bind ^W list-windows
      bind w list-windows
      bind z resize-pane -Z
      bind r command-prompt -I \"#W\" { rename-window -- \"%%\" }
      bind R command-prompt -I \"#W\" { rename-window -- \"%%\" }
      bind ^L refresh client
      bind | split-windo
      bind s split-window -v -c \"#{pane_current_path}\"
      bind v split-window -h -c \"#{pane_current_path}\"
      bind '\"' choose-window
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      bind -r -T prefix , resize-pane -L 20
      bind -r -T prefix . resize-pane -R 20
      bind -r -T prefix - resize-pane -D 7
      bind -r -T prefix = resize-pane -U 7
      bind : command-prompt
      bind * setw synchronize-panes
      bind P set pane-border-status
      bind q kill-pane
      bind x swap-pane -D
      bind S choose-session
      bind -T copy-mode-vi v send-keys -X begin-selection
      bind f run-shell 'tmux neww ~/.config/tmux/scripts/tmux-sessionizer'
      bind N run-shell '~/.config/tmux/scripts/tmux-sessionizer ~/notes'
      bind D run-shell '~/.config/tmux/scripts/tmux-sessionizer ~/dotfiles'
    ";
    
  };
}
