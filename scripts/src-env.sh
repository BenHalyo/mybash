#!/bin/bash
# Sources a python virtual environment
# Assumes the environment variable VENV_DIR is set
# Will autocomplete to subdirectories of VENV_DIR

# Autocomplete subdirectories in $VENV_DIR
function _venv_dir_completion()
{
	local cur=${COMP_WORDS[COMP_CWORD]}
	# Find all directories in $VENV_DIR
	# COMPREPLY=( $(compgen -W "$(find $VENV_DIR/* -maxdepth 0 -type d -exec printf '%f ' {} \;)" -- $cur) )
	COMPREPLY=( $(compgen -W "$(find $VENV_DIR/* -maxdepth 0 -type d -exec basename {} \;)" -- $cur) )
    echo $COMPREPLY
}


function src-env() {
	source $VENV_DIR/$1/bin/activate
}

complete -F _venv_dir_completion src-env
