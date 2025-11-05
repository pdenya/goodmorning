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

# Check for day-of-month specific CSV (e.g., day-of-month-1.csv, day-of-month-15.csv)
day_of_month_csv="day-of-month-${day_of_month}.csv"
if [ -f "$day_of_month_csv" ]; then
    urls=$(tail -n +2 "$day_of_month_csv" | cut -d'"' -f4)
    all_urls="$all_urls $urls"
fi

# Open all URLs in a new Brave window
if [ -n "$all_urls" ]; then
    open -na "Brave Browser" --args --new-window $all_urls
fi
