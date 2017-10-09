#!/usr/bin/env python



import RPi.GPIO as GPIO
import subprocess


# from https://github.com/Howchoo/pi-power-button

GPIO.setmode(GPIO.BCM)
GPIO.setup(3, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.wait_for_edge(3, GPIO.FALLING)

subprocess.call(['shutdown', '-h', 'now'], shell=False)
