#!/bin/bash

# Function with local variable
say_hello() {
    local name="Habeeb"

    echo "Inside function: Hello $name"
}

# Function with regular variable
say_goodbye() {
    person="Habeeb"

    echo "Inside function: Goodbye $person"
}

-------------Global-------------
# Call the first function
say_hello

echo "Outside function: $name"

echo ""

# Call the second function
say_goodbye

echo "Outside function: $person"
