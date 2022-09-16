# check if exactly two arguments
if [ $# != 2 ]; then
    echo "Usage: $0 <number of lines> <string>"
    exit 1
fi

# check if argument 1 is non-negative number
if ! [ $1 -ge 0 ] 2>/dev/null; then
    echo "./echon.sh: argument 1 must be a non-negative integer"
    exit 1
fi

# normal cases
for ((i=0; i<$1; i++)); do
    echo $2
done