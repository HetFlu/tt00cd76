if [ $# -ne 2 ]; then
    echo "Usage: $0 number1 number2"
    exit 1
fi

a=$1
b=$2

echo "Addition: $((a + b))"
echo "Subtraction: $((a - b))"
echo "Multiplication: $((a * b))"
