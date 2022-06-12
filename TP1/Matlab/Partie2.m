clc;
duree = 1; fe=8192;
[sig,t] = gamme(duree, fe);
% soundsc(sig, fe)

%Analyse frequentielle du signal avant filtrage:
f = [0:length(sig)-1]*(fe/length(sig));
fmin =250; fmax = 600; ymax = 0.6;
figure(1)
S = fft(sig)/fe; plot(f, abs(S)); axis([fmin fmax 0 ymax]);
%% Partie 2
%% 1 
%% Chabyshev de type 2:
Df = 10;
fc_b = 340; 
fc_h=360; 
Df = 5;
fc_b = 345; 
fc_h=355; 

fp_b = fc_b - Df/2;
fp_h = fc_h - Df/2;
fa_b = fc_b + Df/2;
fa_h = fc_h + Df/2;
Wp = 2*[fa_b fp_h]/fe; % IN
Ws = 2*[fp_b fa_h]/fe; % EX
Ap=1; Aa=40;
%% A) Filtrage Coup-Bande analogique
%% L'ordre de chaque filtre:
[nd_c2, wnd_c2]= cheb2ord(Wp,Ws,Ap,Aa) ;
%% B) Les coefficient de chaque filtre:
[numd_c2, dend_c2] = cheby2(nd_c2,Aa,wnd_c2,'stop');
%  
%% C) Les reponses fréquentielles;
 figure(2)
 f = linspace(fmin,fmax,1000);
 Hd_c2 = freqz(numd_c2,dend_c2,f,fe); plot(f,20*log10(abs(Hd_c2)));

 %% D1) Tracer l allure temporelle et le spectre d amplitude de lagamme filtree
 figure(3)
 Cheb2 = filter(numd_c2,dend_c2,sig);
 plot(t,Cheb2);title('Cheb2');
 %% D2) Le spectre d'amplitude de la gamme filtrée
figure(4)
ffc = [0:length(Cheb2)-1]*(fe/length(Cheb2));
fmin = 250; fmax = 600; ymax = 0.6;
Sfc = fft(Cheb2)/fe;  plot(ffc, abs(Sfc));  axis([fmin fmax 0 ymax]); hold on;
soundsc(Cheb2, fe)
    
%% Filtre RIF de longueur minimale (fenetre de Kaiser) :
%% A) L'ordre de chaque filtre:
 ep = 1-10^(-Ap/20); da = 10^(-Aa/20);
 [n,wc,beta] = kaiserord([fp_b fa_b fp_h fa_h],[1 0 1],[ep da ep],fe);
 %% B) La fenetre:
 h = fir1(n,wc,'stop',kaiser(n+1,0.5),'noscale') ;
 %% C) La reponse frequentielle du filtre de Kaiser:
%f = linspace(fmin,fmax,1000);
[HK,f] = freqz(h,1,f,fe);
figure(5)
plot(f,20*log10(abs(HK))); axis([fmin fmax -70 10]);

%% D1) Tracer l allure temporelle  de l agamme filtree
 figure(6)
 Filtered_Kaiser = filter(h,1,sig);
 plot(t,Filtered_Kaiser);title('La gamme filtree en utilisant un filtre RIF');
%% D2) Le spectre d'amplitude de la gamme filtrée:
figure(7)
ffc = [0:length(Filtered_Kaiser)-1]*(fe/length(Filtered_Kaiser));
fmin = 250; fmax = 600; ymax = 0.6;
Sfc = fft(Filtered_Kaiser)/fe;  plot(ffc, abs(Sfc));  axis([fmin fmax 0 ymax]); hold on;  
    %% Listen:
   soundsc(Filtered_Kaiser, fe)
%% Comparaison entre les deux filtre RIF et Cheby 2.
figure(8); 
graph = plot(f,20*log10(abs(HK)),f,20*log10(abs(Hd_c2)));
axis([300 400 -70 10]);
legend(graph,'RIF(Kaiser)','Chabyshev de type 2');