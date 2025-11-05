# Good Morning :)

Opens a set of URLs in Brave Browser based on the current day. Opens in 1 new window with tabs for each url. 

## Usage

```bash
./good_morning.sh
```

Automatically opens URLs from:
- `everyday.csv` - every day
- `monday.csv`, `tuesday.csv`, etc. - specific days of the week
- `day-of-month-X.csv` - specific days of the month (e.g., `day-of-month-1.csv`, `day-of-month-15.csv`)

## Setup

To create the initial CSVs in the expected format run:

```bash
./setup.sh
```

## Adding Items

To interactively add items to any CSV file (including creating new day-of-month files):

```bash
./add_item.sh
```