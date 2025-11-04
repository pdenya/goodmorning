# Good Morning :)

Opens a set of URLs in Brave Browser based on the current day. Opens in 1 new window with tabs for each url. 

## Usage

```bash
./good_morning.sh
```

Automatically opens URLs from:
- `everyday.csv` - every day
- `monday.csv`, `tuesday.csv`, etc. - specific days of the week
- `1st-of-the-month.csv` - first day of each month

## Setup

To create those CSVs in the expected format run:

```bash
./setup.sh
```