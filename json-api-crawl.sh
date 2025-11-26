#!/usr/bin/env bash
set -euo pipefail

ARCHIVE_DIR="./"
OUT_DIR="./cso-status"

mkdir -p "$OUT_DIR"

echo "Extracting dates from filenames..."

find "$ARCHIVE_DIR" -type f -name '*?date=*' | while read -r file; do
    # Extract encoded date from filename
    encoded_date="${file##*?date=}"
    encoded_date="${encoded_date%%.*}"

    # Decode %2F → /
    date=$(printf '%b' "${encoded_date//%/\\x}")

    # Convert MM/DD/YYYY -> MM-DD-YYYY for filesystem safety
    safe_date="${date//\//-}"

    # Output filename following API style
    outfile="$OUT_DIR/date=${safe_date}.json"

    echo "Fetching /cso-status/?date=$date"

    wget -q -O "$outfile" \
        "https://istheresewageinthechicagoriver.com/cso-status/?date=${date}"

    echo "Saved → $outfile"
done

echo "Done! JSON saved under: $OUT_DIR/"
