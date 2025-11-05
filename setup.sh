#!/bin/bash

# Create everyday.csv
cat > everyday.csv << 'EOF'
name, url
"Dog Pictures", "https://www.reddit.com/r/dogpictures/new/"
EOF

# Create monday.csv
cat > monday.csv << 'EOF'
name, url
"Cat Pictures", "https://www.reddit.com/r/catpictures/new/"
EOF

# Create tuesday.csv
cat > tuesday.csv << 'EOF'
name, url
"Cat Pictures", "https://www.reddit.com/r/catpictures/new/"
EOF

# Create wednesday.csv
cat > wednesday.csv << 'EOF'
name, url
"Cat Pictures", "https://www.reddit.com/r/catpictures/new/"
EOF

# Create thursday.csv
cat > thursday.csv << 'EOF'
name, url
"Cat Pictures", "https://www.reddit.com/r/catpictures/new/"
EOF

# Create friday.csv
cat > friday.csv << 'EOF'
name, url
"Cat Pictures", "https://www.reddit.com/r/catpictures/new/"
EOF

# Create day-of-month-1.csv
cat > day-of-month-1.csv << 'EOF'
name, url
"Educational Aww", "https://www.reddit.com/r/Awwducational/new/"
EOF

echo "Setup complete! All CSV files created."
