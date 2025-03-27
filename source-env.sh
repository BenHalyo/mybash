# Allows zsh to use bash autocomplete functions and syntax
# Needed for Aaron scripts (goto.sh and scr-env.sh)
autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

# Named directories
export DOCUMENTS=$HOME/Documents
export DOWNLOADS=$HOME/Downloads
export ENV_DIR=$HOME/.env
export VENV_DIR=$ENV_DIR/venv_dir

# Source scripts
source $ENV_DIR/scripts/tex-scripts.sh
source $ENV_DIR/scripts/term-tex-viewer.sh
source $ENV_DIR/scripts/new_course.sh
source $ENV_DIR/scripts/goto.sh
source $ENV_DIR/scripts/src-env.sh
# source $ENV_DIR/scripts/bash-prompt.sh
# source $ENV_DIR/scripts/zsh-prompt.sh

# Set aliases
alias tasks="taskell $ENV_DIR/task_lists/taskell.md"
alias minttex="pdflatex -synctex=1 -interaction=nonstopmode -shell-escape"
alias vimfzf="vim \$(fzf)"
alias vimtree="vim -c NERDTree"
alias pdf="$HOME/.config/kitty/termpdf.py/termpdf.py"
alias eupo="euporie-notebook"
alias icat="kitty +kitten icat"
alias python=python3
alias pip=pip3
alias browser="open -a Microsoft\ Edge"
alias caf="caffeinate -d"

# Goto
export GOTO_LOCATIONS_LIST=$ENV_DIR/locations.txt

# C++ compile
function compile {
	clang++ -std=c++14 -stdlib=libc++ -o $1 $1.cpp
}

function optCompile {
	clang++ -std=c++14 -stdlib=libc++ -O3 -o $1 $1.cpp
}

# PATH
export PYTHONPATH=/Library/Python/3.9/bin:$PYTHONPATH
export PATH=/Users/benjamin_lawson/Library/Python/3.9/bin:$PATH

# OLD -- from before 2024 computer
# export PATH=/Library/PostgreSQL/14/bin:$PATH
# export PATH=/Users/benhalyo/.local/bin:$PATH
# export PYTHONPATH=/Users/benhalyo/Documents/programming_projects/data:$PYTHONPATH
# source $HOME/Documents/programming_projects/web/loadenv.sh
