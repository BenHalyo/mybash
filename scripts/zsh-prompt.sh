# Set terminal colors
set_bg_color() {
    echo "%K{$1}"
}
set_fg_color() {
    echo "%F{$1}"
}
set_term_colors() {
    echo "$(set_bg_color $1)$(set_fg_color $2)"
}

# Right Triangle and Right Arrow (powerline)
RT=$'\uE0B0'
RA=$'\uE0B1'
RC=$'\uE0B4'

# Define colors
col_black='0;0;0'
col_white='250;250;250'
col_dark='80;80;80'
col_matcha='46;179;152'
col_blue='28;152;232'
col_yellow='241;211;43'
col_orange='232;151;28'
col_purple='142;105;200'

bold="%B"
reset="%b"

# Define the prompt
custom_zsh_prompt() {
    prompt="${bold}$(set_term_colors ${col_matcha} ${col_black})%n ${reset}"
    prompt="${prompt}${bold}$(set_term_colors ${col_yellow} ${col_matcha})${RC}${reset} ${bold}~${reset} "
    prompt="%{$prompt%}"
    export PROMPT="$prompt"

    # Set RPROMPT with additional information if needed
    RPROMPT='%D{%H:%M:%S}'
}

# Set the prompt
custom_zsh_prompt

