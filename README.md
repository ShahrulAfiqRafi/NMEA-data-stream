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
Based on data available online, plotting longitude and latitude from RATLL[^1], RATLL.txt

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
Planning to calculation for Own Ship course change or speed change or both via RATTM[^2]
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

## ALL TARGETS IN RADAR PLOTTING

![image](https://user-images.githubusercontent.com/85572170/148971931-55c0a603-6e98-485c-b0e8-6c177f2b90e4.png)
Here classified the data based on the targets
Here is the raw data plot of CPA and speed. Smoothing via Loess smoothing is necessary for simulation testing
## TARGET 1
![target1](https://user-images.githubusercontent.com/85572170/148993750-f7a2e3cc-b476-4f35-bdb0-a2fc7397062f.jpg)

## TARGET 2
![target2](https://user-images.githubusercontent.com/85572170/148993794-f86709ab-5d92-4a67-b61e-0b4ae96826de.jpg)

## TARGET 3
![target3](https://user-images.githubusercontent.com/85572170/148993829-4f805d8a-5fe4-48a9-907c-e89f5488cdd4.jpg)

## TARGET 4
![target4](https://user-images.githubusercontent.com/85572170/148993846-aaefa004-56b8-4581-b9cb-5a9eefe38c0b.jpg)





[^1]: RATLL = RAdar Target Latitude Longitude
[^2]: RATTM = RAdar Target Tracked Message
[^3]: RAOSD = RAdar Own Ship Data
       Consists of course and speed
[^4]: OSNC = Own Ship New Course
[^5]: OSNS = Own Ship New Speed
