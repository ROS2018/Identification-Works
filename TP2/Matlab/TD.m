% TD:
clear,clc; m =3;n=3;
%% 1) Simulation du syst`eme `a partir de sa forme polynomiale
%% 1) 
Te= 1;
Se = 0.1;
%% 2) 
A= 1;
B = [0 0.04];
C = 1;
D = 1;
F = [1 -1.6  0.64];
ModelExact = idpoly(A,B,C,D,F,Se,Te);

%% 3) 
% sequence binaire pseudo-aleatoire ==> 'RBS': Generates a Random, Binary Signal.

N = 630;
b= 10 ;
u = 5*idinput(N,'PRBS',[0 1/b]);
%u = iddata([],u,1);
subplot(m,n,1);
plot(u,'o')

%% 4) Simuler une r´ealisation du signal de sortie du syst`eme soumis `a l’entr´ee pr´ec´edente.
options = simOptions('AddNoise',false);
ysansbruit = sim(ModelExact, u, options);
subplot(m,n,2);
plot(ysansbruit);


%% 5) Compl´eter le script pour simuler le syst`eme en pr´esence de bruit et calculer le rapport signal sur bruit puis l’exprimer en d´ecibels.
options = simOptions('AddNoise',true);
yavecbruit = sim(ModelExact, u, options);
subplot(m,n,3);
plot(yavecbruit);
rsb = 20*log10(std(ysansbruit)/std(yavecbruit - ysansbruit));
disp(['RSB (dB) = ' num2str(rsb)]);

%% 6) Creer l’object donnees de l’identification et tracer les signaux d’entr´ee-sortie dans les domaines temporel et fr´equentiel.
dat_per  = iddata( yavecbruit,u,Te) ;
figure(2), plot(dat_per);
% figure(3), plot(fft(dat_per));
 
 dat_no_per = iddata(ysansbruit,u,Te) ;
% figure(4), plot(dat_no_per);
% figure(5), plot(fft(dat_no_per));
% 
%% 1.2 Identification d’une forme polynomiale du syst`eme
%% 1) Identification de la reponse impulsionnelle.
figure(6)
nb=100; modimp1 = cra(dat_per,nb); hold on;
modimp2 = cra(dat_no_per,nb);

%% 2) Identification d’un modéle ARX:

% disp('Identification d’un modéle ARX:')
  na= 3 ; nb = 1;
  Orders = [na nb 1]; 
  modarx = arx(dat_no_per, Orders); %present(modarx)
 [y,RT2] = compare(modarx, dat_per)
%  AIC = aic(modarx);
 FPE = fpe(modarx);
%  resid(dat_no_per,modarx);

%% The smallest value:
na=1:3 ; nb=1:3; nk = 1;
order = struc(na,nb,nk);
modarx = cell(size(order,1),1);
for ct = 1:size(order,1)
modarx{ct} = arx(dat_no_per, order(ct,:));
end
V = fpe(modarx{:});
[Vmin, order_min] = min(V)
order(order_min,:)
modarx = arx(dat_per, order(order_min,:))