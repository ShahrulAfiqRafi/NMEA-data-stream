import matplotlib.pyplot as plt
import numpy as np

file = "D:/nmeais/RATLL.txt"
ratll = open(file,'r')
lines = ratll.readlines()

count = 0
# Strips the newline character
for line in lines:
    count += 1
    #print(line)
    nmea = line.split(',')
    plt.plot(nmea[4], nmea[2], 'o')
plt.show()

        