#!/bin/bash

DATE=`date +%Y-%m-%d`
BKPDIR="$HOME/.minecraft-bkp"

if [ ! -d "$BKPDIR" ]; then
    echo "Creating new folder: $BKPDIR"
    mkdir $BKPDIR
fi

if [ -d "$BKPDIR/$DATE" ]; then
    if [ -n "$(ls -A $BKPDIR/$DATE/)" ]; then
        echo "Cleaning existing files."
        rm -R $BKPDIR/$DATE/*
    fi
else
    echo "Creating new folder: $BKPDIR/$DATE"
    mkdir $BKPDIR/$DATE
fi

echo "Coping files..."
cp -R $HOME/.minecraft/saves/* $BKPDIR/$DATE/
echo "Done! Happy Mining =)"
