clc,clear;
% TP:
%% 1) the function : (simulsyst)

%% 2) simulation de la process:
N = 1000; Te = 0.02 ; a=5; b=4; sigma = 0.4;
perturbation = true;
[data, modex] = simulsyst(N,Te,a,b,sigma,perturbation);
[data_sans_bruit, modex_sans_bruit] = simulsyst(N,Te,a,b,sigma,0);
%plot(data);

%% le degré de persistance?
Ped = pexcit(data);

% La reponse frequentielle du system:
figure(2)
margin(d2c(modex,'tustin'));

% Le spectre de l'entree :
figure(3)
fe =1/Te;
ffc = (0:length(data.u)-1)*(fe/length(data.u));
fft_u = fft(data.u); 
plot(ffc, abs(fft_u/length(data.u))); 
% L'autocorrelation de l'entrée:
[Ruu, Tau] = xcorr(data.u,'unbiased');
plot(Tau,Ruu);
% Le spectre de la sortie:
figure(4)
ffc = fe*(0:length(data.y)-1)/length(data.y);
fft_y = fft(data.y);
plot(ffc, abs(fft_y/length(data.y)));




%% 3) Identification:

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
compare(data_sans_bruit,modex_sans_bruit,modmv)
% opt = armaxOptions;
% opt.Focus = 'simulation';
% opt.SearchOption.MaxIter = 100;
% opt.Display = 'off';
% opt.SearchOption.Tolerance = 1e-10;
% disp('gn');
% opt.SearchMethod = 'gn';
% modmv= armax(data, [3 3 3 1],opt)
% disp('lm');
% opt.SearchMethod = 'lm';
% modmv= armax(data, [3 3 3 1],opt)
% disp('gna');
% opt.SearchMethod = 'gna';
% modmv= armax(data, [3 3 3 1],opt)
% disp('grad');
% opt.SearchMethod = 'grad';
% modmv= armax(data, [3 3 3 1],opt)
% disp('lsqnonlin');
% opt.SearchMethod = 'lsqnonlin';
% modmv= armax(data, [3 3 3 1],opt)
% disp('auto');
% opt.SearchMethod = 'auto';
% modmv= armax(data, [3 3 3 1],opt)

% meme resultats sauf grad

%% D) Erreure de sortie :

disp('Erreure de sortie');
nb=2:6 ; nf=2:5;nk = 1;
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

% nb=3; nf = 3; nk=1;
% modoe= oe(data, [nb nf nk],opt)

%% 4) Ecrire une fonction validation(data,modid) qui, pour chaque methode utilisee :
clc;
perturbation = false;
[data_no_perturbation, modex_no_perturbation] = simulsyst(N,Te,a,b,sigma,perturbation);
validation(data, data_no_perturbation, modex_no_perturbation,5);
disp('Moindre Carre');
validation(data, data_no_perturbation, modcc,6);
disp('Variabale instrumentale');
validation(data,data_no_perturbation,modiv4,7);
disp('Maximum de vraisemnlance');
validation(data,data_no_perturbation,modmv,8);
disp('Erreure de sortie');
validation(data,data_no_perturbation,modoe,9);

%% 5) simulation:
analyse(modex, modcc, 10);
analyse(modex, modiv4, 11);
analyse(modex, modmv, 12);
analyse(modex, modoe, 13);


