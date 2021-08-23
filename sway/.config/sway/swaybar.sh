#!/bin/sh

datetime="$(date +' %d %B %Y | %I:%M %p ')"

for bat in /sys/class/power_supply/BAT?; do
	# [ "$(cat "$bat"/status)" = "Charging" ] && batstatus="<span fgcolor='#e5c07b'>↯</span>"
	[ "$(cat "$bat"/status)" = "Charging" ] && charging=1

	capacity=$(tr -d '\n' <"$bat"/capacity)
	total_charge=$((total_charge + capacity))
	n=$((n + 1))
done
battery_charge=$(printf '%.0f' "$((total_charge / n))")

# MINIMAL {{{

if [ -n "$charging" ]; then
	battery=" <span fgcolor='#98c379'>$battery_charge%</span> |"
else
	case "$battery_charge" in
	[0-1][0-9]) battery=" <span fgcolor='#e06c75'>$battery_charge%</span> |" ;;
	*) battery=" $battery_charge% |" ;;
	esac
fi

disk=" $(df -h / | awk ' /[0-9]/ {print $3 "/" $2}') |"
memory=" $(free -h | awk '/^Mem:/ {print $3 "/" $2}') |"
cpu=" $(sed 's/\(.\)..$/.\1°C/' /sys/class/thermal/thermal_zone2/temp) |"
# cpu="<span bgcolor='#e06c75' fgcolor='#282c34'>  </span><span fgcolor='#282c34' bgcolor='#abb2bf'> $(sensors | awk '/Core 0/ {gsub("+",""); print $3}') </span>"

[ "$(cat /sys/class/net/wlp4s0/operstate)" = "up" ] &&
	wifi=" $(nmcli -t dev wifi | grep '^\*' | cut -d ':' -f 8) |"
# wifi=" <span bgcolor='#61afef' fgcolor='#282c34'> ﬉ </span><span bgcolor='#abb2bf' fgcolor='#282c34'> $(nmcli -t dev wifi | grep '^\*' | cut -d ':' -f 8) </span> "

[ "$(cmus-remote -Q 2>/dev/null)" ] &&
	cmus=" $(cmus-remote -Q | grep "tag title " | cut -c 11-) - $(cmus-remote -Q | grep "tag artist " | cut -c 12-) |"
# }}}

# OTHER MDDULES {{{

# todo list
# grep -B 1 -h "DEADLINE:.*$(date +'%Y-%m-%d')" documents/notes/org/* | head -n1

# volume
# [ $(amixer get Master | grep -o "\[on\]\|\[off\]" | uniq) = "[off]" ] &&
# 	audio="<span size='large' font_weight='bold'>婢</span>" ||
# 	audio="<b>奔</b> $(amixer get Master | grep -Po "\d+%" | head -n1)"

# bluetooth
# [ "$(bluetooth | grep "on\|off")" = "on" ] &&
# bluetooth="   $(bluetoothctl info | grep 'Alias:' | sed 's/^.*://')  "

# recorder
# [ "$(pgrep wf-recorder 2> /dev/null)" ] && recorder="<span fgcolor='#e06c75'> REC</span> |" || recorder=""

# kernel ver
# kernel="  $(uname -r | cut -c1-7)"

# cpu frequency
# cpufreq="  $(printf "%0.fMhz" "$(awk '/MHz/ {print $4 ; exit}' /proc/cpuinfo)") |"

# }}}

echo "$cmus$wifi$cpu$memory$disk$battery$datetime" | tr '\n' ' '
