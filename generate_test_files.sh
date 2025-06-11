#!/bin/bash

mkdir -p test_project && cd test_project

touch report.docx
touch notes.doc
touch readme.txt
touch manual.pdf

touch image1.jpg
touch photo.jpeg
touch banner.gif
touch icon.png

touch movie.mp4
touch clip.avi
touch show.mkv
touch trailer.mov

touch song.mp3
touch voice.wav
touch background.ogg
touch track.flac

touch backup.zip
touch package.tar.gz
touch data.rar

touch random.xyz
touch my_script.sh
touch data.csv

touch doc{1..5}.pdf
touch img_{a..e}.png
touch video{1..3}.mp4
touch sound{01..03}.mp3
touch archive{A..C}.zip

echo "Test files generated in $(pwd)"
