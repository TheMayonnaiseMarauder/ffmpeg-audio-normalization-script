#!/bin/bash
targetDirectory=$1
if [ -z "$1" ]; then
  targetDirectory=$PWD
fi
if [[ "${targetDirectory}" != */ ]]; then
    targetDirectory="${targetDirectory}/"
fi
echo
mkdir "${targetDirectory}normalized/"
for file in "${targetDirectory}"/*.mp3; do
  ffmpeg -i "$file" -af loudnorm=I=-16:LRA=11:TP=-1.5 "${file/\/audio\///audio/normalized}"
done

