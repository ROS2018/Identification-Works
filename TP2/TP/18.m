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

