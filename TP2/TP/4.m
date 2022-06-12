%% A) Moindre carre:
disp('Moindre carre:');
na=1:5 ; nb=1:5; nk = 1;
order = struc(na,nb,nk);
Modcc = cell(size(order,1),1);
for ct = 1:size(order,1)
Modcc{ct} = arx(data, order(ct,:));
end
V = fpe(Modcc{:});
[Vmin, order_min] = min(V)
orderes= order(order_min,:)
modcc = arx(data, order(order_min,:))
