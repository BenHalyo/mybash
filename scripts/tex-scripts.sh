
function newtex {
    m_flag=false
    class='article'
    b_flag=false
    f_name='template'
    open_vim=false
    
    function printhelp() {
        echo 'Make formatted latex document
    Options
      -m include minted package
      -o open new tex file in vim
      -c [class name] set document class (default=article)
         -> Set class to lp if want lesson plan template
      -b basic mode: do not include any packages
      -f [filename] set filename (default=template)'
    }
    
    if [[ "$#" == 1 ]]; then
        f_name="$1"
    fi

    while getopts 'hmoc:bf:' flag; do
       case "${flag}" in
           h) printhelp; return ;;
           m) m_flag=true;;
           c) class="${OPTARG}" ;;
           b) b_flag=true ;;
           f) f_name="${OPTARG}";; 
           o) open_vim=true;;
       esac
    done
    
    if [[ "${class}" == beamer ]]; then
        cp ~/.env/templates/tex-beamer-template.tex "${f_name}.tex"
    elif [[ "${class}" == lp ]]; then
        cp ~/.env/templates/lesson-plan-template.tex "${f_name}.tex"
    else
        cp ~/.env/templates/tex-template.tex "${f_name}.tex"
        sed -i '' s/article/"${class}"/g "${f_name}.tex"
    fi

    if [[ "$b_flag" == true ]]; then
        sed -i '' -e '/\\usepackage/d' "${f_name}.tex" 
    fi
    
    if [[ "$m_flag" == true ]]; then
        sed -i '' -e '/%Packages/p; s/%Packages/\\usepackage{minted}/g' "${f_name}.tex" 
    fi

    if [[ "$open_vim" == true ]]; then
        vim "${f_name}.tex"
    fi
}

function rmtex {
    if [[ $1 =~ '-+' ]]; then
        if [[ $1 == '-a' ]]; then
            find . -name "$2*" -maxdepth 1 -exec rm {} \;
        elif [[ $1 == '-s' ]]; then
            find . -name "$2*" -a ! \( -name "*tex" -o -name "*pdf" \) -maxdepth 1 -exec rm {} \;
        elif [[ $1 == '--help' ]]; then
            echo 'remove latex file bundle\nrmtex [-option] [filename]\nOptions\n-a delete all associated files inluding pdf\n-s delete only supplementary files (.aux, .log, etc)'
        else
            echo $1\ is\ not\ a\ valid\ flag 
        fi
    else
        find . -name "$1*" -a ! -name "*pdf" -maxdepth 1 -exec rm {} \;
    fi
}
