function newcourse {
    if [[ "$1" == "-h" || "$1" == "-help" ]]; then
        echo "Give course name as only argument"
    elif [[ "$#" != 1 ]]; then
        echo "You have $# arguments."
        echo "The only argument should be course code/name"
    else
        mkdir "$1"
        mkdir "$1/lessonplans"
        mkdir "$1/lessonplans/archive"
        mkdir "$1/syllabus"
        mkdir "$1/syllabus/archive"
        mkdir "$1/assessments"
        mkdir "$1/assessments/archive"
        mkdir "$1/resources"
    fi
}
