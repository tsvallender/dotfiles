alias weather="curl wttr.in/~Isle+of+Wight"
alias pubip="curl -4 icanhazip.com"
alias less="less -r"
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP
alias checkport="sudo netstat -tnlp | grep"
alias de="devenv"
alias dockerpurge="docker system prune --all --force --volumes"
alias dockerkill="docker stop \`docker ps -a -q\`"
alias vi="nvim"
alias tp="$HOME/bin/tmux_pair.bash"
alias tpdf="termpdf.py"
alias tn="tmux new-window -n"
alias genpdf="pandoc -o migration.pdf -t ms"

