clc,clear;
load('tube.mat')
plot(data)
%% 1) Decouper les donnees:
data1= data(1:24000/3);
data2= data(24000/3+1:24000*2/3);
data3= data(24000*2/3+1:24000);
plot(data1,data2,data3)

%% 2) Identifier 
%% a) data 1:
nf=1:10 ; nb=1:10; nk = 0;
order = struc(nb,nf,nk);
modoe1 = cell(size(order,1),1);
for ct = 1:size(order,1)
modoe1{ct} = oe(data1, order(ct,:));
end
V = fpe(modoe1{:}); [Vmin, order_min] = min(V);
modoe1 = oe(data1, order(order_min,:))
compare(data1,modoe1);

%% b) data 2 :
nf=1:10 ; nb=1:10; nk = 0;
order = struc(nb,nf,nk);
modoe2 = cell(size(order,1),1);
for ct = 1:size(order,1)
modoe2{ct} = oe(data1, order(ct,:));
end
V = fpe(modoe2{:}); [Vmin, order_min] = min(V);
modoe2 = oe(data1, order(order_min,:))
compare(data2,modoe2);

%% c) data 3 :
nf=1:10 ; nb=1:10; nk = 0;
order = struc(nb,nf,nk);
modoe3 = cell(size(order,1),1);
for ct = 1:size(order,1)
modoe3{ct} = oe(data1, order(ct,:));
end
V = fpe(modoe3{:}); [Vmin, order_min] = min(V);
modoe3 = oe(data1, order(order_min,:))
compare(data3,modoe3);

%% 3) Validation coisee:
compare(data,modoe1,modoe2,modoe3)

%% 4) Le retard:
cra(data,100); % nk = 3;

nf=4:10 ; nb=4:10; nk = 4;
order = struc(nb,nf,nk);
modoe = cell(size(order,1),1);
for ct = 1:size(order,1)
modoe{ct} = oe(data, order(ct,:));
end
V = fpe(modoe{:}); [Vmin, order_min] = min(V);
modoe = oe(data, order(order_min,:))
compare(data1,modoe);

%% 5) la valeur initiale:
m=etfe(data);

