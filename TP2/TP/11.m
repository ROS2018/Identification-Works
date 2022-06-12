%% Do the experiment:
load('tergane20.mat')

%% Creat an object of data:
Te = 1/1000;
data = iddata(z,yc,Te);
plot(data);
