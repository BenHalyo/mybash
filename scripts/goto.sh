#!/bin/bash
# Changes to $WORKSPACE/[dir]
#   will autocomplete the directories

# Autocomplete names for directories in $GOTO_LOCATIONS_LIST
function _complete_goto()
{
	local cur=${COMP_WORDS[COMP_CWORD]}
	# Find all directories in $GOTO_LOCATIONS_LIST
	# NF - ignore blank lines
	# !/#/ - ignore lines starting with #
	COMPREPLY=( $(compgen -W "$(awk 'NF && !/#/ {print $1}' $GOTO_LOCATIONS_LIST)" -- $cur) )

}

function goto(){
    dest=$(grep "^$1 " $GOTO_LOCATIONS_LIST | awk '{print $2}')
    eval "cd $dest"
}

complete -F _complete_goto goto
alias 2="goto"
complete -F _complete_goto 2

