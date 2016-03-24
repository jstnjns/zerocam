#!/bin/sh
# Zerocam Trigger

button=16

setup ()
{
  echo Starting
  gpio mode $button in
}

listen ()
{
  echo "Press the button to take a photo..."
  while [ `gpio read $button` = 1 ]; do
    sleep 0.5
  done
}

capture ()
{
   today=$(date +"%d-%m-%Y-%H-%M")

   fswebcam
    --config cam.conf
    --title "HOTELJONES"
    --subtitle "BIRFDAY"
    --save photo_"$today".jpg -q

   echo "Photo captured!"
}

setup
while true;
do
  listen
  capture
done