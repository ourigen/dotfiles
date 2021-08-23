if [[ -z $DISPLAY ]] && [[ $TTY = "/dev/tty1" ]]; then
	export XDG_SESSION_TYPE=wayland
	export XDG_CURRENT_DESKTOP=sway
	# export QT_QPA_PLATFORM=wayland-egl
	# export _JAVA_AWT_WM_NONREPARENTING=1
	export XDG_CONFIG_HOME="$HOME/.config"
	export XDG_CACHE_HOME="$HOME/.cache"
	export XDG_DATA_HOME="$HOME/.local/share"
	exec sway
fi
