%% D) Erreure de sortie :

disp('Erreure de sortie');
nb=2:5 ; nf=2:5;nk = 1;
order = struc(nb, nf ,nk);
Modoe= cell(size(order,1),1);
% les options de oe:
opt = oeOptions;
opt.SearchOption.MaxIter = 100;
opt.SearchOption.Tolerance = 1e-10;
opt.SearchMethod = 'lm';
% calcul:
for ct = 1:size(order,1)
Modoe{ct} = oe(data, order(ct,:));
end
V = fpe(Modoe{:});
[Vmin, order_min] = min(V);
orderes= order(order_min,:);
modoe= oe(data, order(order_min,:))
compare(data,modex , modoe)
