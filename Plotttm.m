fid = fopen('D:/nmeais/RATTM.txt');
t = readtable('D:/nmeais/RATTM.txt', 'ReadVariableNames', false);
t.Properties.VariableNames = {'Header', 'Target', 'TDistance', 'Bearing', 'TRe','TSpeed', 'TCourse', 'TrR', 'DistCPA', 'TimeCPA','N','TargetName','TrRe','idk','UTC','Ref'};
%t1 = t(1:50,3:3);,'teset2
%t2 = t(1:50,5:5);
%y = t{:,3:3};   %lat
%x = t{:,5:5};   %lon  
%y1 = y*100000;
%x1 = x*10000;
%s = num2str(num);

%SPLIT TABLE
%TARGET 1
target1 = t(t.Target == 1,:);
t1cpa = target1{:,9:9};
t1dist = target1{:,3:3};
t1brg = target1{:,4:4};
t1crs = target1{:,7:7};
t1cpasmooth = smooth(t1cpa,0.1,'rloess');
t1speed = target1{:,6:6};
t1speedsmooth = smooth(t1speed,0.1,'rloess');
t1rad = deg2rad(t1brg);
t1radsmooth = smooth(t1rad,0.1,'rloess');

t1cpav = t1cpa*10;
t1time = target1{:,15:15};
t1hour= floor(t1time/10000);
t1min1 = rem(t1time,10000);
t1min2= floor(t1min1/100);
t1sec = rem(t1time,100);
t1sech = t1sec/3600;
t1minh = t1min2/60;
time1 = t1hour+t1sech+t1minh;

t1differences = t1cpa - t1cpasmooth ;
%smooth table
t1smoothtable = table(t1dist,t1cpasmooth,t1cpa,t1brg,t1crs,time1,t1differences);

%TARGET 2
target2 = t(t.Target == 2,:);
t2cpa = target2{:,9:9};
t2dist = target2{:,3:3};
t2brg = target2{:,4:4};
t2crs = target2{:,7:7};
t2cpasmooth = smooth(t2cpa,0.1,'rloess');
t2speed = target2{:,6:6};
t2speedsmooth = smooth(t2speed,0.1,'rloess');
t2rad = deg2rad(t2brg);
t2radsmooth = smooth(t2rad,0.1,'rloess');

t2cpav = t2cpa*10;
t2time = target2{:,15:15};
t2hour= floor(t2time/10000);
t2min1 = rem(t2time,10000);
t2min2= floor(t2min1/100);
t2sec = rem(t2time,100);
t2sech = t2sec/3600;
t2minh = t2min2/60;
time2 = t2hour+t2sech+t2minh;

t2differences = t2cpa - t2cpasmooth ;
%smooth table
t2smoothtable = table(t2dist,t2cpasmooth,t2cpa,t2brg,t2crs,time2,t2differences);

%TARGET 3
target3 = t(t.Target == 3,:);
t3dist = target3{:,3:3};
t3cpa = target3{:,9:9};
t3brg = target3{:,4:4};
t3crs = target3{:,7:7};
t3cpasmooth = smooth(t3cpa,0.1,'rloess');
t3speed = target3{:,6:6};
t3speedsmooth = smooth(t3speed,0.1,'rloess');
t3rad = deg2rad(t3brg);
t3radsmooth = smooth(t3rad,0.1,'rloess');

t3cpav = t3cpa*10;
t3time = target3{:,15:15};
t3hour= floor(t3time/10000);
t3min1 = rem(t3time,10000);
t3min2= floor(t3min1/100);
t3sec = rem(t3time,100);
t3sech = t3sec/3600;
t3minh = t3min2/60;
time3 = t3hour+t3sech+t3minh;

t3differences = t3cpa - t3cpasmooth ;
%smooth table
t3smoothtable = table(t3dist,t3cpasmooth,t3cpa,t3brg,t3crs,time3,t3differences);

%TARGET 4
target4 = t(t.Target == 4,:);
t4cpa = target4{:,9:9};
t4dist = target4{:,3:3};
t4brg = target4{:,4:4};
t4crs = target4{:,7:7};
t4cpasmooth = smooth(t4cpa,0.1,'rloess');
t4speed = target4{:,6:6};
t4speedsmooth = smooth(t4speed,0.1,'rloess');
t4rad = deg2rad(t4brg);
t4radsmooth = smooth(t4rad,0.1,'rloess');

t4cpav = t4cpa*10;
t4time = target4{:,15:15};
t4hour= floor(t4time/10000);
t4min1 = rem(t4time,10000);
t4min2= floor(t4min1/100);
t4sec = rem(t4time,100);
t4sech = t4sec/3600;
t4minh = t4min2/60;
time4 = t4hour+t4sech+t4minh;

t4differences = t4cpa - t4cpasmooth;
%smooth table
t4smoothtable = table(t4dist,t4cpasmooth,t4cpa,t4brg,t4crs,time4,t4differences);


%PLOTTING
figure('Name','Target 1')
subplot(2,1,1)
plot(time1,t1cpa)
yline(0.2,'-.',{'Safe Zone','CPA<0.2'})
title('Distance CPA')
grid on
%%subplot(2,2,2)
%%plot(time1,t1speed)
%%title('Target Speed')
%%grid on
subplot(2,1,2)
plot(time1,t1cpasmooth)
yline(0.2,'-.',{'Safe Zone','CPA<0.2'})
title('Distance CPA Smoothened')
%%grid on
%%subplot(2,2,4)
%%plot(time1,t1speedsmooth)
%%title('Target Speed Smoothened')
%%grid on

figure('Name','Target 2')
subplot(2,1,1)
plot(time2,t2cpa)
yline(0.2,'-.',{'Safe Zone','CPA<0.2'})
title('Distance CPA')
%grid on
%subplot(2,2,2)
%plot(time2,t2speed)
%title('Target Speed')
%grid on
subplot(2,1,2)
plot(time2,t2cpasmooth)
yline(0.2,'-.',{'Safe Zone','CPA<0.2'})
title('Distance CPA Smoothened')
grid on
%subplot(2,2,4)
%plot(time2,t2speedsmooth)
%title('Target Speed Smoothened')
%grid on

figure('Name', 'Target 3')
subplot(2,1,1)
plot(time3,t3cpa)
yline(0.2,'-.',{'Safe Zone','CPA<0.2'})
title('Distance CPA')
%grid on
%subplot(2,2,2)
%plot(time3,t3speed)
%title('Target Speed')
%grid on
subplot(2,1,2)
plot(time3,t3cpasmooth)
yline(0.2,'-.',{'Safe Zone','CPA<0.2'})
title('Distance CPA Smoothened')
%grid on
%subplot(2,2,4)
%plot(time3,t3speedsmooth)
%title('Target Speed Smoothened')
grid on

figure('Name', 'Target 4')
subplot(2,1,1)
plot(time4,t4cpa)
yline(0.2,'-.',{'Safe Zone','CPA<0.2'})
title('Distance CPA')
%grid on
%subplot(2,2,2)
%plot(time4,t4speed)
%title('Target Speed')
%grid on
subplot(2,1,2)
plot(time4,t4cpasmooth)
yline(0.2,'-.',{'Safe Zone','CPA<0.2'})
title('Distance CPA Smoothened')
%grid on
%subplot(2,2,4)
%plot(time4,t4speedsmooth)
%title('Target Speed Smoothened')
grid on

figure('Name', 'Polar Plot Target Vessel')
ax = polaraxes;
polarscatter(t1radsmooth,t1dist,'b.')
hold on
polarplot(t1radsmooth,t1dist,'b')
hold on
polarscatter(t2radsmooth,t2dist,'g.')
hold on
polarplot(t2radsmooth,t2dist,'g')
hold on
polarscatter(t3radsmooth,t3dist,'m.')
hold on
polarplot(t3radsmooth,t3dist,'m')
hold on
polarscatter(t4radsmooth,t4dist,'r.')
hold on
polarplot(t4radsmooth,t4dist,'r')
hold on
ax.ThetaZeroLocation = 'top';
ax.ThetaDir = 'clockwise';
