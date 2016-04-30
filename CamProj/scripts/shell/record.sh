#!/bin/sh
 
file_name=/home/pi/CamProj/video/webcam_

for i in `seq 1 1 100` 
do
   	echo "Welcome $i times..."

	current_time=$(date "+%b-%d-%Y__%H.%M.%S")
	echo "Current Time : $current_time"
	 
	new_fileName=$file_name$current_time.mp4
	echo "New FileName: " "$new_fileName"
	
	#This was the toughest part of the whole project to find the optimal settings for recording.
	avconv -f video4linux2 -r 16 -s 640x480 -i /dev/video0 -c:v mpeg4 -r 16 -an -s 640x480 -b 1024k -t 00:30:30 -y $new_fileName

	echo "Done with recording..."

done
 
