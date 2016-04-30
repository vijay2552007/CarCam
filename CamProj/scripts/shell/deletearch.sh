#!/bin/sh

file_logs_name=delete_logs_
file_video_name=delete_video_

current_time=$(date "+%b-%d-%Y__%H.%M.%S")
	echo "Current Time : $current_time"

new_log_fileName=$file_logs_name$current_time.log
new_video_fileName=$file_video_name$current_time.log
	echo "New FileName: " "$file_video_name" "$file_logs_name"

sleep 60s

echo "New FileName: " "$new_video_fileName"
 
sudo find /home/pi/CamProj/logs/python/ /home/pi/CamProj/logs/shell/ -mtime +30 -type f -name "*.log" -delete >> /home/pi/CamProj/logs/shell/$new_log_fileName 2>&1

sudo find /home/pi/CamProj/video/ -mtime +30 -type f -name "*.mp4" -delete >> /home/pi/CamProj/logs/shell/$new_video_fileName 2>&1

