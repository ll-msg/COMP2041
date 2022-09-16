# if not exactly 2 arguments
if [ $# != 2 ]; then
    echo "Usage: ./scraping_courses.sh <year> <course-prefix>"
    exit 1
fi

# if argument not in range

if ! [[ "$1" =~ ^[0-9]+$ ]]; then 
    echo "./scraping_courses.sh: argument 1 must be an integer between 2019 and 2022"
    exit 1
elif [ $1 -lt 2019 -o $1 -gt 2022 ]; then
    echo "./scraping_courses.sh: argument 1 must be an integer between 2019 and 2022"
    exit 1
fi

# normal cases
first_undergraduate='https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:'$1'%20+unsw_psubject.studyLevel:undergraduate%20+unsw_psubject.educationalArea:'
first_postgraduate='https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:'$1'%20+unsw_psubject.studyLevel:postgraduate%20+unsw_psubject.educationalArea:'
undergraduate=$first_undergraduate$2'*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:ugrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0'
postgraduate=$first_postgraduate$2'*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:pgrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0'

curl -sL $undergraduate | jq '.contentlets[] | {course_code: .code, course_title: .title}' | sed '/{/d' | sed '/}/d' | sed 's/"course_code"//' | sed 's/://' | sed 's/"course_title"//' | sed 's/",//' | sed 's/"//' | tr -d '\n'  | sed 's/"/\n/g' | sed 's/^[ \t]*//g' | tr -s ' ' > under_course.json
curl -sL $postgraduate | jq '.contentlets[] | {course_code: .code, course_title: .title}' | sed '/{/d' | sed '/}/d' | sed 's/"course_code"//' | sed 's/://' | sed 's/"course_title"//' | sed 's/",//' | sed 's/"//' | tr -d '\n'  | sed 's/"/\n/g' | sed 's/^[ \t]*//g' | tr -s ' ' > post_course.json

cat under_course.json post_course.json | sort | uniq
