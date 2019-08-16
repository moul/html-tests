#!/bin/bash
# from https://stackoverflow.com/questions/21395159/shell-script-to-create-a-static-html-directory-listing

ROOT=.
HTTP="/"
OUTPUT="404.html"

i=0
echo "<UL>" > $OUTPUT
for filepath in `find "$ROOT" -maxdepth 4 -mindepth 1 -type d| grep -v .git | sort`; do
    path=`basename "$filepath"`
    echo "  <LI>$path</LI>" >> $OUTPUT
    echo "  <UL>" >> $OUTPUT
    for i in `find "$filepath" -maxdepth 1 -mindepth 1 -type f| sort`; do
        file=`basename "$i"`
        echo "    <LI><a href=\"/$path/$file\">$file</a></LI>" >> $OUTPUT
    done
    echo "  </UL>" >> $OUTPUT
done
echo "</UL>" >> $OUTPUT
