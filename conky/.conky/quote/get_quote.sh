#!/bin/bash

# Function to fetch a motivational quote
get_quote() {
    quote=$(curl -s "https://zenquotes.io/api/random" | jq -r '.[0].q')
    echo "$quote"
}

# Generate a new quote
new_quote=$(get_quote)

# Output the quote
echo "$new_quote"
