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
target1 = t(t.Target == 1,:);
target2 = t(t.Target == 2,:);
target3 = t(t.Target == 3,:);
target4 = t(t.Target == 4,:);

%Target1
writetable(target4,'D:/nmeais/targettm4.xlsx');