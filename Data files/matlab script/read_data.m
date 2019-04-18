%% Cleaning
clc;
clear variables
close all
%% Preparation 
filename = 'West_Midlands.xlsx';
data_raw = xlsread(filename);
rows = length(data_raw);
data_trim = zeros(rows,5);
data_trim(:,1) = data_raw(:,1);
data_trim(:,2) = data_raw(:,15);
data_trim(:,3) = data_raw(:,16);
data_trim(:,4) = data_raw(:,17);
data_trim(:,5) = data_raw(:,18);
data_final = zeros(18,5);

for i = 1:18
    a = 1999;
    data_final(i,1)= a+i;
end

for r = 1:18
    a= 1999;
    for c = 1:rows
        if data_raw(c,1)== a+r
            data_final(r,2) =  data_final(r,2)+ data_trim(c,2);
            data_final(r,3) =  data_final(r,3)+ data_trim(c,3);
            data_final(r,4) =  data_final(r,4)+ data_trim(c,4);
            data_final(r,5) =  data_final(r,5)+ data_trim(c,5);
           
        end
     end
end
xlswrite ('Data_WM',data_final);