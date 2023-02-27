#!/bin/bash

# Define the input file and output file formats
FROM_FORMAT="png"
TO_FORMAT="jpg"

# Function to convert a single file
function convert_file {
  # Get the filename without the extension
  FILENAME=$(basename -- "$1")
  FILENAME="${FILENAME%.*}"
  
  # Generate the output filename with the new extension
  OUTPUT_FILENAME="$FILENAME.$TO_FORMAT"
  
  # Convert the file using the appropriate command
  if [[ "$FROM_FORMAT" == "png" && "$TO_FORMAT" == "jpg" ]]; then
    convert "$1" "$OUTPUT_FILENAME"
  elif [[ "$FROM_FORMAT" == "wav" && "$TO_FORMAT" == "mp3" ]]; then
    ffmpeg -i "$1" -codec:a libmp3lame -qscale:a 2 "$OUTPUT_FILENAME"
  else
    echo "Unsupported conversion: $FROM_FORMAT to $TO_FORMAT"
  fi
}

# Check if the input and output formats are supported
if [[ "$FROM_FORMAT" == "png" && "$TO_FORMAT" == "jpg" ]] || [[ "$FROM_FORMAT" == "wav" && "$TO_FORMAT" == "mp3" ]]; then
  # Loop through all files with the input format in the current directory
  for FILE in *."$FROM_FORMAT"; do
    convert_file "$FILE"
  done
  
  echo "Conversion complete."
else
  echo "Unsupported conversion: $FROM_FORMAT to $TO_FORMAT"
fi

