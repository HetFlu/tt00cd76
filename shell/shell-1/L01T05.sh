if [ $# -ne 3 ]; then
    echo "Usage: ./L01T05.sh file1 file2 file3"
    exit 1
fi

file1=$1
file2=$2
file3=$3

home="$HOME"

rm -f "$home/$file1"
rm -f "$home/$file2"
rm -f "$home/$file3"

echo "I deleted the following files: $file1, $file2, $file3"