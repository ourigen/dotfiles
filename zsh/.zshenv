# zshenv is used for variables accessible to non-interactive programs (ie. scripts)

# don't export ZDOTDIR because it makes it system-wide
# and changes $ZDOTDIR/.zshenv
ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

# https://wiki.archlinux.org/index.php/Zsh
typeset -U PATH path
path=(
	"$path[@]"
	"$HOME/.local/bin"
	"/var/lib/flatpak/exports/bin/"
)
export PATH

# export TERM="xterm-256color"
export VISUAL="nvim"
export EDITOR="$VISUAL"
export BROWSER="firefox"
export PAGER="less -R"
export MANPAGER="$PAGER"

# $HOME cleanup
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export LESSHISTFILE=-
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export R_ENVIRON_USER="$XDG_CONFIG_HOME/R/.Renviron"
export TEXMFHOME="$XDG_DATA_HOME/texmf"
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"
export TEXMFCONFIG="$XDG_CONFIG_HOME/texlive/texmf-config"

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --prompt="> " --pointer="-" --marker="+" --info=inline
--bind ctrl-y:preview-up,ctrl-e:preview-down
--bind up:preview-up,down:preview-down
--color=fg:#c0caf5,bg:#24283b,hl:#7aa2f7
--color=fg+:#c0caf5,bg+:#24283b,hl+:#7aa2f7
--color=info:#414868,prompt:#f7768e,pointer:#bb9af7
--color=marker:#9ece6a,spinner:#f7768e,header:#a9b1d6,border:#414868'

# nnn
export NNN_COLORS='4321' # color for 1 2 3 4 tabs
export NNN_OPTS='ce'
export NNN_OPENER="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/plugins/nuke"
export NNN_PLUG='p:preview-tui;f:fzcd;a:autojump;b:bulknew;x:xdgdefault;m:mtpmount'
export NNN_FCOLORS='04030402070506080b090d01'
export NNN_TRASH=1
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_BMS="w:~/pictures/wallpapers;p:~/projects;d:~/downloads;s:/mnt/srvshare/;c:~/courses;u:/run/media/arch/"

export MOZ_ENABLE_WAYLAND=1
export MOZ_DBUS_REMOTE=1

export BAT_THEME="base16"
# export QT_PLUGIN_PATH=/usr/lib/qt/plugins
# export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
