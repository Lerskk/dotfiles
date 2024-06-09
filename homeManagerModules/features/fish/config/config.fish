if status is-interactive
  ### FISHER ###
  if not functions -q fisher; and status is-interactive
    curl -sL https://git.io/fisher | source && fisher update || fisher install jorgebucaran/fisher
  end

  ### VARIABLES ###
  # fix clipboard with tmux + nvim
  set -Ux DISPLAY :1
  set -Ux SSH_AUTH_SOCK ~/.1password/agent.sock

  set -gx EDITOR nvim

  ### ALIASES / ABBREVIATIONS / FUNCTIONS ###
  # ls -> exa
  alias exa "exa --color=always --group-directories-first --icons --git" # settings
  alias ls "exa -alhg" # alias for ATL + L
  abbr ls "exa -alhg" # my preferred listing
  abbr la "exa -a"  # all files and dirs
  abbr ll "exa -lg"  # long format
  abbr lt "exa -aT" # tree listing

  # cat -> bat
  abbr cat "bat"
  # rm -> trash-cli
  abbr rm "trash"

  abbr z "zellij"
  abbr za "zellij attach"

  # confirm before overwriting something
  abbr cp "cp -i"
  abbr mv "mv -i"
  # mkdir make full path
  abbr mkdir "mkdir -p"
  # print only one, human-readable, total for each argument
  abbr du "du -hs"
  # human readable
  abbr free "free -h"
  # file info/position, line number, smart case for searching
  alias less "less -MNi" # alias for ALT + P
  abbr less "less -MNi"

  # paru
  abbr paru-r "paru -Rns" # remove packages
  abbr paru-c "paru -Rns \$(paru -Qdtq)" # cleanup

  # editors
  abbr v "nvim"

  # git
  abbr g "git"
  abbr gs "git status"
  abbr gl "git log --oneline"
  abbr glg "git graph"
  abbr gll "git log"
  abbr grl "git reflog"
  abbr ga "git add"
  abbr gap "git add -p"
  abbr gai "git add -i"
  abbr gaa "git add --all"
  abbr gc "git commit -m"
  abbr gca "git commit -am"
  abbr gac "git add --all && git commit -m"
  abbr gapc "git add -p && git commit -m"
  abbr gaic "git add -i && git commit -m"
  abbr gco "git checkout"
  abbr gcob "git checkout -b"
  abbr gd "git diff"
  abbr gdw "git diff --word-diff"
  abbr gp "git push"
  abbr gpf "git push --force-with-lease"
  abbr gpl "git pull"
  abbr gst "git stash save -u"
  abbr gstp "git stash pop"
  abbr gstl "git stash list"
  abbr gbrl "git branch -l"
  abbr gbrd "git branch -d"
  abbr gbrD "git branch -D"
  abbr gbrm "git branch -m"
  abbr gbl "git blame -w -C -C -C -L" 
  abbr gre "git restore"
  abbr gr "git reset"
  abbr grh "git reset --hard"
  abbr gm "git merge --no-ff"
  abbr greb "rebase --committer-date-is-author-date"
  abbr gc "git clone"
  abbr grema "git remote add"
  abbr gremr "git remote remove"
  abbr gmaint "git maintenance start"
  abbr gba "git add --all && git commit -m 'backup' && git push"

  # dotfiles
  abbr d "chezmoi" 
  abbr ds "chezmoi status" 
  abbr da "chezmoi add"
  abbr dr "chezmoi re-add"
  abbr dc "chezmoi cd"
  abbr dap "chezmoi apply -v"


    ### FUNCTIONS ###

  function notes
    cd ~/notes
    nvim .
  end

  function ts
    cd ~/.config/tmux/scripts/
    ./tmux-sessionizer
  end

  function wdev
    if [ -d $argv[1] ]
      set PREVIOUS_DIR (pwd)
      cd $argv[1]
    
      tmux split-window -h "npm run dev"
      tmux split-window -v
      tmux select-pane -t 2
      tmux split-window -h "npx prisma studio --browser none"
      tmux select-pane -t 0
      tmux resize-pane -Z -t:.1
      nvim .

      cd $PREVIOUS_DIR
    end
  end

  function gccr
    set BINARY_PATH (mktemp)
    gcc $argv -o $BINARY_PATH && $BINARY_PATH;
    rm $BINARY_PATH;
  end

  function gccm
    set BINARY_PATH (mktemp)
    gcc -Wall $argv -o $BINARY_PATH && valgrind --tool=memcheck $BINARY_PATH;
    rm $BINARY_PATH;
  end

  function update-all --description "Rate mirrors and run a system update"
    set TMPFILE "$(mktemp)";
    sudo true; # ask for the sudo password at the beginning
    rate-mirrors --save=$TMPFILE arch --max-delay=21600 \
      && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
      && sudo mv $TMPFILE /etc/pacman.d/mirrorlist \
      && paru -Scc --noconfirm \
      && paru -Syyu --noconfirm
  end

  ### VI MODE ###
  set -g fish_cursor_default block; set -g fish_cursor_insert line
  function fish_user_key_bindings
    fish_vi_key_bindings
    # fish_default_key_bindings
  end

  ### FASTFETCH ON STARTUP ###
  function fish_greeting
    fastfetch
  end

  ### PROMPT ###
  if type -q starship
    starship init fish | source
  end
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
