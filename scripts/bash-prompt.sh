# Does a custom bash prompt path that shortens parent directories in deep file hierarchies
# And specifies the coloring for it

function custom_bash_prompt() {
# precmd() {
    echo 'Case D'
	set_bg_color() {
		# Arg 1: the background color in RGB ('100;100;200')
		echo "\[$(printf "\x1b[48;2;${1}m")\]"
	}
	set_fg_color() {
		# Arg 1: the foreground color in RGB ('100;100;200')
		echo "\[$(printf "\x1b[38;2;${1}m")\]"
	}
	set_term_colors() {
		# Arg 1: the background color in RGB ('100;100;200')
		# Arg 2: the foreground color in RGB ('45;255;12')
		echo "\[$(printf "\x1b[48;2;${1}m\x1b[38;2;${2}m")\]"
	}

	# Right Triangle and Right Arrow (powerline)
	RT=$'\uE0B0'
	RA=$'\uE0B1'
	RC=$'\uE0B4'

	col_black='0;0;0'
	col_white='250;250;250'
	col_dark='80;80;80'
	col_matcha='46;179;152'
	col_blue='28;152;232'
	col_yellow='241;211;43'
	col_red='232;51;28'
	col_orange='232;151;28'
	col_purple='142;105;200'


	bold="\[\e[1m\]"
	reset="\[\e[0m\]"

	### SECTION: Username
	user_theme="$(set_term_colors ${col_matcha} ${col_black})${bold}"
	prev_bg=${col_matcha}
	prompt="${user_theme} \u ${reset}"

	### SECTION: Home/Root
	cwd=$(pwd)
	if [[ $cwd == $HOME* ]]; then 
		# Path starts with Home - draw yellow section with ~
		next_bg=${col_yellow}
		symbol='~'
		cwd="${cwd#$HOME}"
	else
		# Path under root - draw orange section with /
		next_bg=${col_orange}
		symbol='/'
	fi

	sep="$(set_term_colors ${next_bg} ${prev_bg})$RC"
	home_theme="$(set_fg_color ${col_black})"
	prompt="${prompt}${sep}${home_theme} ${symbol} "
	prev_bg=${next_bg}

	### SECTION: Working Dir

	# Remove starting /
	if [[ $cwd =~ /* ]]; then
		cwd=${cwd#/}
	fi

	# Split path into dirs
	IFS="/" read -a dirs <<< $cwd

	# Iterate over directories in current working path
	num_dirs=${#dirs[@]}
	for (( i=0; i<${num_dirs}; i++ )); do
		dir=${dirs[$i]}
		if (( $i + 1 == $num_dirs )); then
			# Last Dir -> Blue
			sep="$(set_term_colors ${col_blue} ${prev_bg})$RT"
			dir_theme="$(set_fg_color ${col_white})"
			prompt="${prompt}${sep}${dir_theme} ${dir} "
			prev_bg=${col_blue}
		elif (( $i == 0 )); then
			# First Dir -> Gray
			# When more than 2 levels, upper dirs get cut to 2 letters
			if [[ $num_dirs -gt 2 ]]; then
				dir=${dir:0:2}
			fi
			sep="$(set_term_colors ${col_dark} ${prev_bg})$RT"
			dir_theme="$(set_fg_color ${col_white})"
			prompt="${prompt}${sep}${dir_theme} ${dir} "
			prev_bg=${col_dark}
		else
			# When more than 2 levels, upper dirs get cut to 2 letters
			if (( $num_dirs - $i > 2 )); then
				dir=${dir:0:2}
			fi
			prompt="${prompt}$RA ${dir} "
		fi
	done

	### SECTION: Virtual Env
	if [[ ! ( -z $VIRTUAL_ENV_PROMPT ) ]]; then
		# if VIRTUAL_ENV_PROMPT is defined:
		sep="$(set_term_colors ${col_purple} ${prev_bg})$RT"
		venv_theme="$(set_fg_color ${col_white})"
		prompt="${prompt}${sep}${venv_theme} ${VIRTUAL_ENV_PROMPT} "
		prev_bg=${col_purple}
	fi

	### SECTION: Final arrow
	prompt="${prompt}${reset}$(set_fg_color ${prev_bg})$RT "

	export PS1="${prompt}${reset}"
}

# echo 'Case A'

# # Set the actual bash prompt
# if ${use_color} ; then
#     echo 'Case B'
# 	# export PROMPT_COMMAND=custom_bash_prompt
# 	export precmd=custom_bash_prompt
# else
#     echo 'Case C'
# 	export PS1='\u:\w\$ '
# fi

#function _update_ps1() {
#    PS1=$(powerline-shell $?)
#}
#
#if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi

export LS_COLORS=$LS_COLORS:'ow=1;33'

#eval "$(starship init bash)"
