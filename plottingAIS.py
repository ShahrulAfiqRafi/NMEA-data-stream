import matplotlib.pyplot as plt
import numpy as np
from pyais import FileReaderStream

file = "D:/nmeais/logs3.nmeasim"
ratll = open(file,'r')
lines = ratll.readlines()

for msg in FileReaderStream(file):
    decoded_message = msg.decode()
    ais_content = decoded_message.content
    print("\n",ais_content)
    latitude=ais_content["lat"]
    longitude=ais_content["lon"]
    deg = ais_content["course"]
    print("\n",latitude,longitude)
    
    plt.plot(latitude,longitude, 'b.')
    


#count = 0
# Strips the newline character
#for line in lines:
    #count += 1
    #print(line)
    
plt.show()

        