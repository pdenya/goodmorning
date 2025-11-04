#!/bin/bash

# Get current day of week and day of month
day_of_week=$(date +%A | tr '[:upper:]' '[:lower:]')
day_of_month=$(date +%d | sed 's/^0*//')

# Collect all URLs
all_urls=""

# Always add URLs from everyday.csv
if [ -f "everyday.csv" ]; then
    urls=$(tail -n +2 everyday.csv | cut -d'"' -f4)
    all_urls="$all_urls $urls"
fi

# Add URLs from day-specific CSV (monday.csv, tuesday.csv, etc.)
day_csv="${day_of_week}.csv"
if [ -f "$day_csv" ]; then
    urls=$(tail -n +2 "$day_csv" | cut -d'"' -f4)
    all_urls="$all_urls $urls"
fi

# If it's the 1st of the month, add URLs from 1st-of-the-month.csv
if [ "$day_of_month" = "1" ]; then
    if [ -f "1st-of-the-month.csv" ]; then
        urls=$(tail -n +2 "1st-of-the-month.csv" | cut -d'"' -f4)
        all_urls="$all_urls $urls"
    fi
fi

# Open all URLs in a new Brave window
if [ -n "$all_urls" ]; then
    open -na "Brave Browser" --args --new-window $all_urls
fi
