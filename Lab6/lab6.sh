#!/bin/bash
# This program checks to see if each media file in the
# medialab directory is in medialab/media.xml.

Notfound=0
NotInMedia=0
echo "Files not in media.xml: "
for item in $(ls ~/medialab)
do
 item=$(echo $item | cut -d'/' -f 2 )
 if [[ -z "$(grep $item ~/medialab/media.xml)" ]]; then
    echo $item
    NotInMedia=$(( NotInMedia + 1))
 fi
done

echo "Files not found in medialab: "
IFSOLD=$IFS
IFS=$'\n'  # Needed to ignore the space for file \gportal\economic\gportal.sh -kid

for item in $(grep filename ~/medialab/media.xml | cut -d'>' -f 2 | cut -d'<' -f 1 )
# If want unique files only, add  | sort | uniq to end of grep above (see below).
# This will take out duplicate NULL files for example, resulting in 3068 media
# files instead of 3076.   
# for item in $(grep filename ~/medialab/media.xml | cut -d'>' -f 2 | cut -d'<' -f 1 | sort | uniq )

do
  if [[ ! -e ~/medialab/$item ]]
  then
    echo $item
    NotFound=$(( NotFound + 1 ))
  fi
done
IFS=$IFSOLD

echo "$NotInMedia media files in medialab directory that are NOT listed in media.xml"
echo "$NotFound media files in media.xml that are NOT in medialab directory"



