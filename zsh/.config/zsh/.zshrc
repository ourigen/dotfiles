# OPTIONS {{{
# The following lines were added by compinstall
zstyle :compinstall filename "$ZDOTDIR/.zshrc"
# https://gist.github.com/ctechols/ca1035271ad134841284
autoload -Uz compinit # Perform compinit only once a day.
setopt EXTENDED_GLOB
for dump in $ZDOTDIR/.zcompdump(#qN.m2); do
  compinit
  if [[ -s "$dump" && (! -s "$dump.zwc" || "$dump" -nt "$dump.zwc") ]]; then
    zcompile "$dump"
  fi
done
unsetopt EXTENDED_GLOB
compinit -C
# compinit
_comp_options+=(globdots)
# End of lines added by compinstall

HISTFILE="$XDG_DATA_HOME/zsh/history"
HISTSIZE=1000                  # The maximum number of events stored in the internal history list.
SAVEHIST=1000                  # The maximum number of history events to save in the history file.
setopt APPEND_HISTORY          # Append to the history file rather than replace it.
setopt AUTO_CD                 # [default] If can't execute the directory, perform the cd command to that.
setopt EXTENDED_GLOB           # Treat the `#`, `~` and `^` characters as part of patterns for globbing.
setopt BRACE_CCL               # Expand expressions in braces which would not otherwise undergo brace expansion.
setopt GLOB_DOTS               # Don't require a leading '.' in a filename to be matched explicitly.
setopt MARK_DIRS               # Append a trailing `/` to all directory names resulting from globbing.
setopt HIST_FIND_NO_DUPS       # don't show dupes when searching
setopt HIST_IGNORE_DUPS        # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_SPACE       # [default] Don't record an entry starting with a space.
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks before recording an entry.
setopt HIST_SAVE_NO_DUPS       # Don't write duplicate entries in the history file.
setopt SHARE_HISTORY           # Share history between all sessions.
setopt COMPLETE_ALIASES        # Prevent aliases from being substituted before completion is attempted.
setopt INTERACTIVE_COMMENTS    # [default] Allow comments even in interactive shells.
setopt NO_NOMATCH              # [default] unmatched patterns are left unchanged
setopt LIST_PACKED             # make completion lists more densely packed
setopt IGNORE_EOF              # [default] prevent accidental C-d from exiting shell

stty -ixon
zmodload zsh/complist

autoload -Uz edit-command-line
zle -N edit-command-line

# }}}

### COMPLETION ### {{{
# https://www.masterzen.fr/2009/04/19/in-love-with-zsh-part-one/
# http://zsh.sourceforge.net/Doc/Release/Completion-System.html
zstyle ':completion:*' completer _expand _complete _correct _approximate
# In the form ‘yes=num’, where ‘yes’ may be any of the ‘true’ values (‘yes’, ‘true’, ‘on’ and ‘1’), menu completion will be turned on if there are at least num matches. In the form ‘yes=long’, menu completion will be turned on if the list does not fit on the screen.
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}  # Use color specificatins set up for ls

# Enable keyboard navigation of completions in menu (start menu only if list doesn’t fit the screen)
zstyle ':completion:*' menu select=5
# Make completion:
# - Try exact (case-sensitive) match first.
# - Then fall back to case-insensitive.
# - Accept abbreviations after . or _ or - (ie. f.b -> foo.bar).
# - Substring complete (ie. bar -> foobar).
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Allow completion of ..<Tab> to ../ and beyond.
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(..) ]] && reply=(..)'
# zstyle ':completion:*' verbose yes

# zstyle ':completion:*' list-prompt %SAt %p: hit TAB for more, or the character to insert%s
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# zstyle ':completion:*:messages' format 'completing %d'
zstyle ':completion:*:descriptions' format "%F{yellow}%d%f"
# zstyle ':completion:*:warnings' format "%F{red}no matches for:%f %d"
zstyle ':completion:*:corrections' format '%B%F{red}%d (errors: %e)%b%f'
# zstyle ':completion:*' auto-description 'specify: %d'

# If the name given is the empty string the name of the tag for the matches will be used as the name of the group. So, to have all different types of matches displayed separately, one can just set:
zstyle ':completion:*' group-name ''

# }}}

source "$XDG_DATA_HOME/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$XDG_DATA_HOME/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
source "$XDG_DATA_HOME/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh"

### BINDINGS ### {{{
bindkey -v # Use Vi mode

bindkey -M viins '^K' history-incremental-pattern-search-backward
bindkey -M viins '^J' history-incremental-pattern-search-forward
# bindkey -M viins '^H' vi-backward-char
# bindkey -M viins '^L' vi-forward-char

# https://man.archlinux.org/man/zshzle.1#STANDARD_WIDGETS
bindkey '^P' vi-up-line-or-history
bindkey '^N' vi-down-line-or-history
bindkey '^?' backward-delete-char
bindkey '^X^E' edit-command-line
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# }}}

alias ls="ls --color=auto --group-directories-first --human-readable"
alias grep="grep --color=auto"
alias rm="rm --recursive --verbose"
alias mkdir="mkdir --verbose --parent"
alias mv="mv --interactive --verbose"
alias cp="cp --recursive --interactive --verbose"
alias wget="wget --continue"
alias ":q"="exit"
alias v="nvim"
alias g="git"
alias o="xdg-open"
# alias vc="$EDITOR $XDG_CONFIG_HOME/nvim/init.lua"
# alias zc="$EDITOR $ZDOTDIR/.zshrc"
alias so="source $ZDOTDIR/.zshrc"
alias ssh="env TERM=xterm-256color ssh"

# FUNCTIONS {{{
function nn() {
	ORG_REFILE="$HOME/sync/Notes/inbox.org"
	if [ -z "$1" ]; then
		"$EDITOR" "$ORG_REFILE"
	else
		printf "\n* TODO %s\n<%s>\n" "$*" "$(date +'%Y-%m-%d %a %H:%M')" >> "$ORG_REFILE"
	fi
}

function fn() {
	rg  -n -i '\*+\s\w*\s' "$HOME/sync/Notes/" | fzf --layout=reverse --height 50% --ansi | sed -E 's/(.*):([0-9]+):.*/\1 +\2/g' | xargs -r ${EDITOR:-nvim}
}

function conf() {
	if [[ -z $1 ]]; then
		fd --type f --hidden . "$HOME/projects/dotfiles/" | fzf | xargs -r $EDITOR
	else
		fd --type f --hidden "$1" "$HOME/projects/dotfiles/" | xargs -r $EDITOR
	fi
}

function pacfd() {
	# Use paru so that both AUR and Arch repo are searched
	paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -S
}

function pacrm() {
	pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns
}

function mkcd() {
	mkdir -p "$@" && cd "$_"
}

function 2pdf() {
	libreoffice --convert-to pdf $@
}

function 2bib() {
	if [ -f "$1" ]; then
		DOI=$(pdfinfo "$1" | grep -io "doi:.*" | grep -o "10.[^)^ ]*") ||
		DOI=$(pdftotext "$1" 2>/dev/null - | grep -io "doi:.*" -m 1 | grep -o "10.[^)^ ]*") ||
		DOI=$(pdftotext "$1" 2>/dev/null - | grep -io "doi\\.org/.*" -m 1 | grep -o "10.[^)^ ]*")
	else
		DOI="$1"
	fi

	printf "Downloading bibliographies for %s... " "$1"
	curl -s "http://api.crossref.org/works/$DOI/transform/application/x-bibtex" -w '\n\n' >> "$2" && 
		printf "Done!\n"
}

function 2opus() {
	youtube-dl --ignore-errors --extract-audio --audio-quality 0 --audio-format opus -o '$HOME/downloads/music/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' "$1"
}

function git() {
	# adds a git subcommand "root" such that:
	# `git root` changes to the repo root
	# `git root COMMAND`` runs COMMAND from repo root (eg. git root ls)
	if [ "$1" = "root" ]; then
		shift
		local ROOT="$(command git rev-parse --show-toplevel 2> /dev/null || echo -n .)"
		if [ $# -eq 0 ]; then
			cd "$ROOT"
		else
			(cd "$ROOT" && eval "$@")
		fi
	else
		command git "$@"
	fi
}

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# function set_win_title() {
# 	echo -ne "\033]0;${USER}@${HOST}: ${PWD/#$HOME/~} - Alacritty\007"
# }

# precmd_functions+=(set_win_title)
