# AIS NMEA DATA STREAM

## NMEA data stream decodes using TCP connection
Uses NMEA data stream simulator for data plotting and tcp connection

NMEA Data Stream using NMEA Simulator 1.3.1

![image](https://user-images.githubusercontent.com/85572170/148020163-158a497c-cf23-4b45-bc38-fa8537407827.png)
### !AIVDM Data plotting
Simulator does not need filtering, plotting longitude and latitude from $RATLL
![image](https://user-images.githubusercontent.com/85572170/148020236-fe2dcbfc-fbca-4bd1-8261-76225198c57d.png)



# $RATLL Data plotting
## Uses data sample obtain online
Based on data available online, plotting longitude and latitude from $RATLL, RATLL.txt

![image](https://user-images.githubusercontent.com/85572170/148020741-491cd66e-e66a-499c-a0e0-1db676cc9dea.png)

## Classification via target
Based on the log given, there is only four targets that has been tracked uses MATLAB
```
       1  2       3 4        5 6    7         8 9 10
       |  |       | |        | |    |         | | |
$--TLL,xx,llll.ll,a,yyyyy.yy,a,c--c,hhmmss.ss,a,a*hh<CR><LF> 

1) Target number 00 – 99 
2) Target latitude
3) N/S 
4) Target longitude
5) E/W 
6) Target name 
7) UTC of data 
8) Target status (see note 1) 
9) Reference target (see note 2) = R, null otherwise 
10) Checksum
```
![image](https://user-images.githubusercontent.com/85572170/148462002-0498be35-19b7-4ecb-870b-d874bc85610e.png)
Few error in this radar tracking where it tracked same vessel 

# $RATTM Collision Avoidance
Planning to calculation for Own Ship course change or speed change or both
```
                                        11     13
       1  2   3   4 5   6   7 8   9   10|    12| 14
       |  |   |   | |   |   | |   |   | |    | | |
$--TTM,xx,x.x,x.x,a,x.x,x.x,a,x.x,x.x,a,c--c,a,a*hh <CR><LF> 
1) Target Number 
2) Target Distance 
3) Bearing from own ship 
4) Bearing Units 
5) Target speed 
6) Target Course 
7) Course Units 
8) Distance of closest-point-of-approach 
9) Time until closest-point-of-approach "-" means increasing 
10) Speed/distance units, K/N/S
11) Target name 
12) Target Status 
13) Reference Target
14) Checksum 
```
Based on few calculation, hopefully to get changing course or speed for collision avoidance
*And hopefully classify approach and receeding targets*

- [x] Acquired data
- [ ] Find OSD bearing and speed due to no RAOSD in data log
- [ ] Calculation for OSNC, OSNS, and both
- [ ] Classify approaching and receeding target vessel




