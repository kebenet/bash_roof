#!/bin/bash


# Test the cut command with different options


# Test 1: Basic usage
echo "Test 1: Basic usage"
echo "Hello, World!" | cut -c 1-5


# Test 2: Specify delimiter
echo "Test 2: Specify delimiter"
echo "apple,banana,orange" | cut -d ',' -f 2


# Test 3: Specify multiple delimiters
echo "Test 3: Specify multiple delimiters"
echo "apple:banana,orange" | cut -d ':,' -f 2


# Test 4: Specify range of characters
echo "Test 4: Specify range of characters"
echo "Hello, World!" | cut -c 7-12


# Test 5: Print specific fields
echo "Test 5: Print specific fields"
echo "apple,banana,orange" | cut -f 1,3 -d ','


# Test 6: Print complement of fields
echo "Test 6: Print complement of fields"
echo "apple,banana,orange" | cut --complement -f 2 -d ','


# Test 7: Print characters from a file
echo "Test 7: Print characters from a file"
cut -c 1-5 ${item}


# Test 8: Print fields from a file
echo "Test 8: Print fields from a file"
cut -f 1,3 -d ',' ${item}


# Test 9: Print characters from stdin
echo "Test 9: Print characters from stdin"
cat ${item} | cut -c 1-5


# Test 10: Print fields from stdin
echo "Test 10: Print fields from stdin"
cat ${item} | cut -f 1,3 -d ','


# Test 11: Print characters from a range of bytes
echo "Test 11: Print characters from a range of bytes"
echo "Hello, World!" | cut -b 1-5


# Test 12: Print fields based on byte positions
echo "Test 12: Print fields based on byte positions"
echo "apple,banana,orange" | cut -b 1,7,13


# Test 13: Print fields based on byte positions from a file
echo "Test 13: Print fields based on byte positions from a file"
cut -b 1,7,13 ${item}


# Test 14: Print fields based on byte positions from stdin
echo "Test 14: Print fields based on byte positions from stdin"
cat ${item} | cut -b 1,7,13


# Test 15: Print fields based on character positions from a file
echo "Test 15: Print fields based on character positions from a file"
cut -c 1,7,13 ${item}


# Test 16: Print fields based on character positions from stdin
echo "Test 16: Print fields based on character positions from stdin"
cat ${item} | cut -c 1,7,13

