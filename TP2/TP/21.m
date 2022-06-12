nf=1:4 ; nb=1:4; nk = 4;
order = struc(nb,nf,nk);
modoe = cell(size(order,1),1);
for ct = 1:size(order,1)
modoe{ct} = oe(data, order(ct,:));
end
V = fpe(modoe{:}); [Vmin, order_min] = min(V);
modoe = oe(data, order(order_min,:))
compare(data1,modoe);

