set fish_greeting
set PAGER "less -r"
set EDITOR "nvim"
set VISUAL "nvim"
set PATH "$HOME/bin:/usr/local/go/bin:$HOME/.rbenv/bin:$PATH"
set XDG_STATE_HOME "$HOME/.state"
set PSPG_CONF "$HOME/.config/pspg"
set LC_ALL "en_GB.UTF-8"
set XDG_CURRENT_DESKTOP "sway"
set XDG_DOWNLOAD_DIR "$HOME/downloads"
set XDG_PICTURES_DIR "$HOME/img"

function fish_prompt
  string join '' -- \n \
    '[' (set_color green) (hostname) (set_color normal) '] ' \
    '[' (set_color blue) (prompt_pwd) (set_color normal) ']' \
    (set_color yellow) (fish_vcs_prompt) (set_color normal) \n \
    '  '
end

set CFLAGS "-Wall -Werror -Wextra"

alias pgcli="~/bin/pgcli/bin/pgcli"
alias weather="curl wttr.in/~Isle+of+Wight"
alias pubip="curl -4 icanhazip.com"
alias less="less -r"
alias be="bundle exec"
alias checkport="sudo netstat -tnlp | grep"
alias dockerpurge="docker system prune --all --force --volumes && docker prune volumes -a"
alias dockerkill="docker stop \`docker ps -a -q\`"
alias ls="lsd"
alias vi="nvim"
alias tn="tmux new-window -n"
alias genpdf="pandoc -o migration.pdf -t ms"
alias cc="gcc $CFLAGS"
alias irc="ssh kernighan -t tmux attach -t irc"
alias wipe="truncate -s 0"

alias krc="kamal app exec -i --reuse 'bin/rails c'"
alias krd="kamal app exec -i --reuse 'bin/rails dbconsole'"
alias krb="kamal app exec -i --reuse 'bash'"

alias rlc="rails console"
alias rls="rails server"
alias rld="rails dbconsole -p"
alias rlr="rails routes"

alias dc="docker compose"
alias dce="docker compose exec"
alias dcb="docker compose exec web /bin/bash"
alias dcew="docker compose exec web"
alias dcbe="docker compose exec web bundle exec"
alias drlc="docker compose exec web bundle exec rails console"
alias drls="docker compose exec web bundle exec rails server"
alias drld="docker compose exec web bundle exec rails dbconsole -p"
alias drldm="dc exec web bundle exec rails db:migrate"
alias dcrldr="dc exec web bundle exec rails db:rollback"
alias drt='dc exec web bundle exec rspec'

# rbenv
set -gx PATH '/home/tsv/.rbenv/shims' $PATH
set -gx RBENV_SHELL fish
command rbenv rehash 2>/dev/null
function rbenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    rbenv "sh-$command" $argv|source
  case '*'
    command rbenv "$command" $argv
  end
end
