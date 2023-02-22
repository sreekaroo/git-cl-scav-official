#!/bin/sh

# FLAG="progituser!"
# Define a custom cipher function
function cipher {
    local input=$1
    local output=""
    local len=${#input}

    # Iterate over each character in the input string
    for ((i=0; i<$len; i++)); do
        local char=${input:$i:1}

        # Apply a simple substitution cipher to the character
        case $char in
            [A-Za-z])
                output="$output$(echo $char | tr 'A-Za-z' 'N-ZA-Mn-za-m')"
                ;;
            [0-9])
                output="$output$(echo $char | tr '0123456789' '9876543210')"
                ;;
            *)
                output="$output$char"
                ;;
        esac
    done

    echo $output
}


echo "Put in the passcode: " && read PASSWORD

if [ $PASSWORD = "fabb7da5f76ae6ce3dbef3ab88421a25c6d1da4f41087c714b2921bdb9a0eab7" ]; then
    # Read input string from user
    read -p "Enter username: " input

    # # Hash the input string using SHA-256 algorithm
    # hash=$(echo -n $input | sha256sum | cut -d ' ' -f 1)

    # Encrypt the hash using the custom cipher function
    FLAG=$(cipher $input)

    echo "Correct Passcode!"
    echo "Here is your hidden flag: $FLAG"
else
    echo "Wrong Passcode... Try again!"
fi

echo $2
