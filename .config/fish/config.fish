set fish_greeting
set PAGER "less -r"
set EDITOR "nvim"
set VISUAL "nvim"
set PATH "$HOME/bin:/usr/local/go/bin:$PATH"
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
    '  '
end
