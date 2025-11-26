#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="./"     # directory to search
FILE_PATTERN="*.html"  # update if needed

echo "Rewriting /cso-status/?date=MM/DD/YYYY → /cso-status/date=MM-DD-YYYY.json"

# This regex captures the full date and rewrites it safely
find "$TARGET_DIR" -type f -name "$FILE_PATTERN" | while read -r file; do
    echo "Processing: $file"

    # Use perl to do:
    #   1. Find /cso-status/?date=MM/DD/YYYY
    #   2. Convert MM/DD/YYYY → MM-DD-YYYY
    #   3. Rewrite as /cso-status/date=MM-DD-YYYY.json
    perl -i -pe '
        s#/cso-status/\?date=(\d{2})/(\d{2})/(\d{4})#/cso-status/date=$1-$2-$3.json#g
    ' "$file"
done

echo "Done!"
