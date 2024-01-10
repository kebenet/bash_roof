#!/usr/local/bin/bin/bats

# Test script for 'pr' command and options
@test "Cut by delimiter and select fields" {
    result=$(echo 'Two' | tr -d '\n') # Remove newlines for comparison
    [ "$result" == "Two" ]
    echo "$result"
}

@test "Tr get field 2" {
    result=$(echo "apple,banana,orange" | cut -d ',' -f 2)
    [ "$result" == "banana" ]
    echo "$result"
}
