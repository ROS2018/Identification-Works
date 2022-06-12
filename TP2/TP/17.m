%% Load the data:
clc,clear;
load('tube.mat')
plot(data)
%% 1) Decouper les donnees:
data1= data(1:24000/3);
data2= data(24000/3+1:24000*2/3);
data3= data(24000*2/3+1:24000);
plot(data1,data2,data3)
