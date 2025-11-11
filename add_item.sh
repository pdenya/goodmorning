#!/bin/bash

# Script to interactively add items to GoodMorning CSV files

# Colors for better readability
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Available CSV files
csv_files=(
    "everyday.csv"
    "monday.csv"
    "tuesday.csv"
    "wednesday.csv"
    "thursday.csv"
    "friday.csv"
)

# Add any existing day-of-month CSV files
for file in day-of-month-*.csv; do
    if [ -f "$file" ]; then
        csv_files+=("$file")
    fi
done

# Add option to create new day-of-month file
csv_files+=("NEW day-of-month file")

# Function to display file contents
display_file_contents() {
    local file=$1
    if [ -f "$file" ]; then
        echo -e "\n${YELLOW}## $file${NC}"
        tail -n +2 "$file" | while IFS=',' read -r name url; do
            # Trim quotes and whitespace
            name=$(echo "$name" | sed 's/^[[:space:]]*"//;s/"[[:space:]]*$//')
            url=$(echo "$url" | sed 's/^[[:space:]]*"//;s/"[[:space:]]*$//')
            if [ -n "$name" ]; then
                echo -e "   - $name → $url"
            fi
        done
    fi
}

# Display menu
echo -e "${BLUE}=== Add Item to GoodMorning ===${NC}\n"

# Show contents of all files first
echo -e "${BLUE}Current contents:${NC}"
for file in "${csv_files[@]}"; do
    if [ "$file" != "NEW day-of-month file" ]; then
        display_file_contents "$file"
    fi
done

echo -e "\n${BLUE}Select a CSV file to add to:${NC}"
echo ""

for i in "${!csv_files[@]}"; do
    file="${csv_files[$i]}"
    if [ -f "$file" ]; then
        count=$(($(wc -l < "$file") - 1))
        echo -e "  ${GREEN}$((i+1))${NC}) $file ${YELLOW}($count items)${NC}"
    else
        echo -e "  ${GREEN}$((i+1))${NC}) $file ${YELLOW}(new file)${NC}"
    fi
done

echo ""
read -p "Enter number (1-${#csv_files[@]}): " selection

# Validate selection
if ! [[ "$selection" =~ ^[0-9]+$ ]] || [ "$selection" -lt 1 ] || [ "$selection" -gt "${#csv_files[@]}" ]; then
    echo -e "${YELLOW}Invalid selection. Exiting.${NC}"
    exit 1
fi

selected_file="${csv_files[$((selection-1))]}"

# Handle NEW day-of-month file creation
if [ "$selected_file" = "NEW day-of-month file" ]; then
    echo ""
    read -p "Enter day of month (1-31): " day_num

    # Validate day number
    if ! [[ "$day_num" =~ ^[0-9]+$ ]] || [ "$day_num" -lt 1 ] || [ "$day_num" -gt 31 ]; then
        echo -e "${YELLOW}Invalid day number. Must be between 1 and 31. Exiting.${NC}"
        exit 1
    fi

    selected_file="day-of-month-${day_num}.csv"

    if [ -f "$selected_file" ]; then
        echo -e "${YELLOW}Warning: $selected_file already exists. Items will be added to it.${NC}"
    fi
fi

# Get name
echo ""
read -p "Enter name: " name

if [ -z "$name" ]; then
    echo -e "${YELLOW}Name cannot be empty. Exiting.${NC}"
    exit 1
fi

# Get URL
read -p "Enter URL: " url

if [ -z "$url" ]; then
    echo -e "${YELLOW}URL cannot be empty. Exiting.${NC}"
    exit 1
fi

# Create file with header if it doesn't exist
if [ ! -f "$selected_file" ]; then
    echo "name, url" > "$selected_file"
    echo -e "${GREEN}Created new file: $selected_file${NC}"
fi

# Add the new entry
echo "\"$name\", \"$url\"" >> "$selected_file"

echo -e "\n${GREEN}✓${NC} Added to $selected_file:"
echo -e "  Name: ${BLUE}$name${NC}"
echo -e "  URL:  ${BLUE}$url${NC}"
