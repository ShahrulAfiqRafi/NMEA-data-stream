#TCP connection 

import socket
from pyais import NMEAMessage, decode_msg
from pyais.decode import decode

HOST = '127.0.0.1'  
PORT = 65432        


with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.connect((HOST, PORT))
    
    while(True):
        data = s.recv(1024) 
        str1 = data.decode('UTF-8') #decode byte data stream from simulator into string 
        texts = str1.split('\r\n') #split every NMEA data header accordingly into array
        x = texts[9] #!AIVDM NMEA header at cell 9
        print("\n",x) 
        print("\n")
        print(decode_msg(x)) #
        

        
