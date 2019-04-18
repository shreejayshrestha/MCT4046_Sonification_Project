%% Cleaning
tic;
clc;
clear variables
close all

%% Preparation 
%filename = 'North_East.xlsx';
filename = 'test.xlsx';
data_test = xlsread(filename);
%data_raw = xlsread(filename);
rows = length(data_test);
%data_trim = zeros(rows,5);
% data_trim(:,1) = data_raw(:,1);
% data_trim(:,2) = data_raw(:,15);
% data_trim(:,3) = data_raw(:,16);
% data_trim(:,4) = data_raw(:,17);
% data_trim(:,5) = data_raw(:,18);

% col = data_trim(:,1);
data_final = zeros(2,5);
%data_final = zeros(18,5);
for i = 1:2
    a = 1999;
    data_final(i,1)= a+i;
end

for r = 1:2
    a= 1999;
    for c = 1:rows
        if data_test(c,1)== a+r
            data_final(r,2) =  data_final(r,2)+ data_test(c,2);
            data_final(r,3) =  data_final(r,3)+ data_test(c,3);
            data_final(r,4) =  data_final(r,4)+ data_test(c,4);
            data_final(r,5) =  data_final(r,5)+ data_test(c,5);
           
        end
          end
end





        


