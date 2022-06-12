%% C) Maximum de vraisemnlance

disp('Maximum de vraisemnlance');
na=1:5 ; nb=2:5; nc=2:5; nk = 1;
order = struc(na,nb,nc,nk);
Modmv= cell(size(order,1),1);
for ct = 1:size(order,1)
Modmv{ct} = armax(data, order(ct,:));
end
V = fpe(Modmv{:});
[Vmin, order_min] = min(V)
orderes= order(order_min,:)
modmv= armax(data, order(order_min,:))
