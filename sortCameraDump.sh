#!/bin/bash
RAW_DIR="raw"
MOVIE_DIR="movies"

RAWFILES=`ls -a1 *.CR2 *.xmp 2>/dev/null`
MOVIEFILES=`ls -a1 *.MOV *.THM 2>/dev/null`
RAW_COUNT=`echo "$RAWFILES" | wc -l` 
MOVIE_COUNT=`echo "$MOVIEFILES" | wc -l` 

if [ $RAW_COUNT -gt 0 ] && [ "$RAWFILES" != "" ]; then
echo "need to create raw folder..."
mkdir -p "$RAW_DIR"
else
RAW_COUNT=0
fi

if [ $MOVIE_COUNT -gt 0 ] && [ "$MOVIEFILES" != "" ]; then
echo "need to create movie folder..."
mkdir -p "$MOVIE_DIR"
else
MOVIE_COUNT=0
fi

echo "Raw Files: $RAW_COUNT"
echo "Movie Files: $MOVIE_COUNT"

COUNT=0
for rawFile in $RAWFILES 
do
	mv "$rawFile" "$RAW_DIR/$rawFile"
	COUNT=`expr $COUNT + 1`
done

for movieFile in $MOVIEFILES
do
        mv "$movieFile" "$MOVIE_DIR/$movieFile"
        COUNT=`expr $COUNT + 1`
done

echo "$COUNT files moved..."

