fid = fopen('D:/nmeais/RATLL.txt');
t = readtable('D:/nmeais/RATLL.txt', 'ReadVariableNames', false);
t.Properties.VariableNames = {'Header', 'Target', 'Lat', 'NS', 'Lon','EW', 'Tarname', 'UTC', 'Status', 'Ref'};
%t1 = t(1:50,3:3);
%t2 = t(1:50,5:5);
%y = t{:,3:3};   %lat
%x = t{:,5:5};   %lon  
%y1 = y*100000;
%x1 = x*10000;
%s = num2str(num);

%SPLIT TABLE
target1 = t(t.Target == 1,:);
xt1 = target1{:,3:3};
yt1 = target1{:,5:5};
xt1dms = xt1*100000;
yt1dms = yt1*100000;

target2 = t(t.Target == 2,:);
xt2 = target2{:,3:3};
yt2 = target2{:,5:5};
xt2dms = xt2*100000;
yt2dms = yt2*100000;

target3 = t(t.Target == 3,:);
xt3 = target3{:,3:3};
yt3 = target3{:,5:5};
xt3dms = xt3*100000;
yt3dms = yt3*100000;

target4 = t(t.Target == 4,:);
xt4 = target4{:,3:3};
yt4 = target4{:,5:5};
xt4dms = xt4*100000;
yt4dms = yt4*100000;


%FOR DMS TO DEGREES
xt1deg = floor(xt1dms/10000000);
yt1deg = floor(yt1dms/1000000);
xt1ms = rem(xt1dms,10000000);
yt1ms = rem(yt1dms,10000000);
xt1min = floor(xt1ms/100000);
yt1min = floor(yt1ms/100000);
xt1sec = rem(xt1ms,100000);
yt1sec = rem(yt1ms,100000);

xt2deg = floor(xt2dms/10000000);
yt2deg = floor(yt2dms/1000000);
xt2ms = rem(xt2dms,10000000);
yt2ms = rem(yt2dms,10000000);
xt2min = floor(xt2ms/100000);
yt2min = floor(yt2ms/100000);
xt2sec = rem(xt2ms,100000);
yt2sec = rem(yt2ms,100000);

xt3deg = floor(xt3dms/10000000);
yt3deg = floor(yt3dms/1000000);
xt3ms = rem(xt3dms,10000000);
yt3ms = rem(yt3dms,10000000);
xt3min = floor(xt3ms/100000);
yt3min = floor(yt3ms/100000);
xt3sec = rem(xt3ms,100000);
yt3sec = rem(yt3ms,100000);

xt4deg = floor(xt4dms/10000000);
yt4deg = floor(yt4dms/1000000);
xt4ms = rem(xt4dms,10000000);
yt4ms = rem(yt4dms,10000000);
xt4min = floor(xt4ms/100000);
yt4min = floor(yt4ms/100000);
xt4sec = rem(xt4ms,100000);
yt4sec = rem(yt4ms,100000);


%convert to sec
xt1sec2 = xt1sec*60;
yt1sec2 = yt1sec*60;

xt2sec2 = xt2sec*60;
yt2sec2 = yt2sec*60;

xt3sec2 = xt3sec*60;
yt3sec2 = yt3sec*60;

xt4sec2 = xt4sec*60;
yt4sec2 = yt4sec*60;

%Target1 DMS
t1londms = table(xt1deg,xt1min,xt1sec2);
t1latdms = table(yt1deg,yt1min,yt1sec2);
xt1min2 = xt1min/60;
xt1sec3 = xt1sec2/360000;
yt1min2 = yt1min/60;
yt1sec3 = yt1sec2/360000;
t1lon = (xt1deg) + (xt1min2) + (xt1sec3);
t1lat = (yt1deg) + (yt1min2) + (yt1sec3);

t2londms = table(xt2deg,xt2min,xt2sec2);
t2latdms = table(yt2deg,yt2min,yt2sec2);
xt2min2 = xt2min/60;
xt2sec3 = xt2sec2/360000;
yt2min2 = yt2min/60;
yt2sec3 = yt2sec2/360000;
t2lon = (xt2deg) + (xt2min2) + (xt2sec3);
t2lat = (yt2deg) + (yt2min2) + (yt2sec3);

t3londms = table(xt3deg,xt3min,xt3sec2);
t3latdms = table(yt3deg,yt3min,yt3sec2);
xt3min2 = xt3min/60;
xt3sec3 = xt3sec2/360000;
yt3min2 = yt3min/60;
yt3sec3 = yt3sec2/360000;
t3lon = (xt3deg) + (xt3min2) + (xt3sec3);
t3lat = (yt3deg) + (yt3min2) + (yt3sec3);

t4londms = table(xt4deg,xt4min,xt4sec2);
t4latdms = table(yt4deg,yt4min,yt4sec2);
xt4min2 = xt4min/60;
xt4sec3 = xt4sec2/360000;
yt4min2 = yt4min/60;
yt4sec3 = yt4sec2/360000;
t4lon = (xt4deg) + (xt4min2) + (xt4sec3);
t4lat = (yt4deg) + (yt4min2) + (yt4sec3);

%combining
tg1 = table(t1lon,t1lat);
tg1x = tg1{:,1:1};
tg1y = tg1{:,2:2};
writetable(tg1,'D:/nmeais/somefile.xlsx');
tg2 = table(t2lon,t2lat);
tg2x = tg2{:,1:1};
tg2y = tg2{:,2:2};
tg3 = table(t3lon,t3lat);
tg3x = tg3{:,1:1};
tg3y = tg3{:,2:2};
tg4 = table(t4lon,t4lat);
tg4x = tg4{:,1:1};
tg4y = tg4{:,2:2};
writetable(tg4,'D:/nmeais/target4.xlsx');

%PLOTTING
%c = linspace(1,10,length(x));
scatter(t1lon,t1lat,'filled','bo')
hold on
%plot(tg1x,tg1y,'b')
hold on
scatter(t2lon,t2lat,'filled','go')
hold on
%plot(tg2x,tg2y,'g')
hold on
scatter(t3lon,t3lat,[],'filled','ro')
hold on
%plot(tg3x,tg3y,'r')
hold on
scatter(t4lon,t4lat,[],'filled','mo')
hold on
%plot(tg4x,tg4y,'m')
hold off




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ydegree = floor(y1/10000000);
%xdegree = floor(x1/100000);
%yms = rem(y1,10000000);
%xms = rem(x1,100000);
%ymin = floor(yms/100000);
%xmin = floor(xms/10000);
%ysec = rem(yms,100000);
%xsec = rem(xms,10000);
%latdms = table(ydegree,ymin,ysec);
%londms = table(xdegree,xmin,ysec);



%c = linspace(1,10,length(x));
%scatter(x,y,[],c, 'filled', 's')
