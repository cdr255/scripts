#!/usr/bin/env bash

echo "Opening Current MPD playlist in k3b for burning...";

currtime=$(date +"%F_%T");

echo \#EXTM3U > $currtime-mpdburn-playlist.m3u;

mpc -f "##EXTINF:%time%,%artist% - %title%\n$HOME/Music/%file%" playlist | perl -F: -p -e 'if (/^#EXTINF/) {$sec=$F[1]*60; $F[2] =~ s/(^.+),/$1/; $sec += $F[2]; s/^.+,(.+)/#EXTINF:$sec,$1/;}' >> $currtime-mpdburn-playlist.m3u;

k3b --audiocd $currtime-mpdburn-playlist.m3u --nosplash

kdialog --yesno "Delete Temporary Extended-M3U playlist?" 

if [ "$?" == 0 ]; then
    echo "Okay, Deleting $currtime-mpdburn-playlist.m3u"
    rm -v $currtime-mpdburn-playlist.m3u;
elif [ "$?" == 1 ]; then
    echo "Okay, Keeping $currtime-mpdburn-playlist.m3u"
else
    kdialog --error "Unexpected Choice."
fi
