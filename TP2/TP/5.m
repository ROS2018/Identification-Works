%% B)Variabale instrumentale:
disp('Variabale instrumentale:');
na=1:5 ; nb=1:5; nk = 1;
order = struc(na,nb,nk);
Modiv4= cell(size(order,1),1);
for ct = 1:size(order,1)
Modiv4{ct} = iv4(data, order(ct,:));
end
V = fpe(Modiv4{:});
[Vmin, order_min] = min(V)
orderes= order(order_min,:)
modiv4= iv4(data, order(order_min,:))
