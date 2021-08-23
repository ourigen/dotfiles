# GIT http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Version-Control-Information
setopt PROMPT_SUBST
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' on %F{yellow} %b%c%u%f' # color,branch,staged,unstaged,reset (default ' (%s)-[%b]%c%u-')
zstyle ':vcs_info:git:*' actionformats ' on %F{yellow} %b%c%u (%a)%f' # default ' (%s)-[%b|%a]%c%u-'
zstyle ':vcs_info:git:*' check-for-changes true
# zstyle ':vcs_info:git:*' check-for-staged-changes true # same as check-for-changes but no %u, faster
zstyle ':vcs_info:git:*' stagedstr '%F{yellow}*%f'
zstyle ':vcs_info:git:*' unstagedstr '%F{red}*%f'
# https://timothybasanov.com/2016/04/23/zsh-prompt-and-vcs_info.html
zstyle ':vcs_info:git:*' patch-format '%10>...>%p%<< (%n applied)'


# function precmd {
# 	[[ -z "$PROMPTGAP" ]] && PROMPTGAP=1 || echo ""
# 	vcs_info
# 	print -Pn "\e]0;%n@%m %~\a"
# }

# Setting custom titles
function preexec {
  print -Pn "\e]0;%n@%m %~ %# $1\a"
}

# MODE
function zle-keymap-select {
    case $KEYMAP in
        vicmd)      VIMODE='%(!.%F{red}❮.%F{magenta}❮)' ;;
        viins|main) VIMODE='%(!.%F{red}❯.%F{magenta}❯)' ;;
    esac

    zle reset-prompt
    zle -R
}

function zle-line-init  {
   zle-keymap-select
}

function zle-line-finish {
   zle-keymap-select
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Prompt-Expansion
PROMPT='%F{blue}%~%(?.. %F{red}!%?)%f${vcs_info_msg_0_} $VIMODE%f '
# %F{green}%n@%m%f at

# ╰ ╭ ─ ╼ ●
