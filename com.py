import serial
import time
import sys
arduino = serial.Serial('COM3', 9600, timeout=0)
time.sleep(2)
arduino.write(sys.argv[1])
arduino.close()
