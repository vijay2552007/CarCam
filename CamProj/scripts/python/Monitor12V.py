#!/usr/bin/env python3

import logging
import time
import RPi.GPIO as GPIO
import os

timestr = '/home/pi/CamProj/logs/python/' + time.strftime("%B-%dth--%I-%M-%S%p") + '.log'

monitor12VPin = 40
GPIO.setmode(GPIO.BCM) # Broadcom pin-numbering scheme
GPIO.setup(monitor12VPin, GPIO.IN)

#logger start
logger = logging.getLogger('myapp')
hdlr = logging.FileHandler(timestr)
formatter = logging.Formatter('%(asctime)s %(levelname)s %(message)s')
hdlr.setFormatter(formatter)
logger.addHandler(hdlr) 
logger.setLevel(logging.INFO)
#logger end

#print ('waiting for 10 secs before start..')
logger.info('waiting for 10 secs before start..%s',GPIO.input(monitor12VPin))
time.sleep(10) # Sleep for 10 seconds. Give some time for complete bootup.

while True: #Keep Monitoring continuosly
    time.sleep(1) # check the GPIO pin every other second
    
    if not (GPIO.input(monitor12VPin)): # Ignition Key is turned off
       time.sleep(25) # Sleep for 25 seconds to avoid accidental Ignition switch off and then check again
       if not (GPIO.input(monitor12VPin)): # If still off, then proceed with shutting down the system.
           logger.info('Shutting down..Pin==%s',GPIO.input(monitor12VPin))
           os.system('shutdown now -h')
       
    
