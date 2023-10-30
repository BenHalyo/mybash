# Source scripts
source $HOME/.env/scripts/tex-scripts.sh
source $HOME/.env/scripts/term-tex-viewer.sh
source $HOME/Documents/programming_projects/web/loadenv.sh

# Set aliases
alias minttex="pdflatex -synctex=1 -interaction=nonstopmode -shell-escape"
alias 2progDir="cd $HOME/Documents/programming_projects"
alias 2ucbcCourses="cd $HOME/Documents/Congo/UCBC/Courses"
alias vimfzf="vim \$(fzf)"
alias vimtree="vim -c NERDTree"
alias python=python3
alias pdf="termpdf.py"
alias eupo="euporie-notebook"
alias icat="kitty +kitten icat"

function compile {
	clang++ -std=c++14 -stdlib=libc++ -o $1 $1.cpp
}

function optCompile {
	clang++ -std=c++14 -stdlib=libc++ -O3 -o $1 $1.cpp
}


export PATH=/Library/PostgreSQL/14/bin:$PATH
export PATH=/Users/benhalyo/.local/bin:$PATH
export PYTHONPATH=/Users/benhalyo/Documents/programming_projects/data:$PYTHONPATH
