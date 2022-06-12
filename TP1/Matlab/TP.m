clc; clear;
duree = 1; fe=8192;
[sig,t] = gamme(duree, fe);
soundsc(sig, fe)

%Analyse frequentielle du signal avant filtrage:
f = [0:length(sig)-1]*(fe/length(sig));
fmin = 100; fmax = 600; ymax = 0.6
figure(1)
S = fft(sig)/fe; plot(f, abs(S)); axis([fmin fmax 0 ymax]);

%% A) Filtrage pas-bas analogique
Ap = 3 ; Aa = 40 ; fc = 420; Df=100;
fp = fc-Df/2;
fa = fc + Df/2;

%% Butterworth:
[nc_b, wnc_b]= buttord(2*pi*fp,2*pi*fa,Ap,Aa,'s'); % en analogique
[nd_b, wnd_b]= buttord(2*fp/fe,2*fa/fe,Ap,Aa); % en discret
% fp et fa auront deux composantes pour un passe/coupe-bande
% Calcul des coefficients de la fonction de transfert : butter, cheby1, cheby2 ou ellip.
 [numc_b, denc_b] = butter(nc_b,wnc_b,'low','s');% en analogique
 [numd_b, dend_b] = butter(nd_b,wnd_b,'low'); % en discret
 
% Calcul de la rｴeponse frｴequentielle du filtre : freqs, freqz
 figure(2)
 f = linspace(fmin,fmax,1000);
 Hc_b = freqs(numc_b,denc_b,2*pi*f); plot(f,20*log10(abs(Hc_b))); hold on;
 Hd_b = freqz(numd_b,dend_b,f,fe); plot(f,20*log10(abs(Hd_b)));
% Filtrage d置n signal, sig ｴevaluｴe aux instants dｴefinis dans un vecteur t :
 sigfc_b = lsim(tf(numc_b,denc_b),sig,t);
 sigfd_b = filter(numd_b,dend_b,sig);
%  %Analyse frequentielle d'un signal apres filtrage:
%     figure(3)
%     ffc = [0:length(sigfc)-1]*(fe/length(sigfc));
%     fmin = 100; fmax = 600; ymax = 0.6;
%     Sfc = fft(sigfc)/fe;  plot(ffc, abs(Sfc));  axis([fmin fmax 0 ymax]); hold on;
 
 %% Chabyshev de type 1:
[nc_c1, wnc_c1]= cheb1ord(2*pi*fp,2*pi*fa,Ap,Aa,'s'); % en analogique
[nd_c1, wnd_c1]= cheb1ord(2*fp/fe,2*fa/fe,Ap,Aa); % en discret
% fp et fa auront deux composantes pour un passe/coupe-bande
% Calcul des coefficients de la fonction de transfert : butter, cheby1, cheby2 ou ellip.
 [numc_c1, denc_c1] = cheby1(nc_c1,Ap,wnc_c1,'low','s');% en analogique
 [numd_c1, dend_c1] = cheby1(nd_c1,Ap,wnd_c1,'low'); % en discret
 
 
% Calcul de la rｴeponse frｴequentielle du filtre : freqs, freqz
 figure(2)
 f = linspace(fmin,fmax,1000);
 Hc_c1 = freqs(numc_c1,denc_c1,2*pi*f); plot(f,20*log10(abs(Hc_c1))); hold on;
 Hd_c1 = freqz(numd_c1,dend_c1,f,fe); plot(f,20*log10(abs(Hd_c1)));
% Filtrage d置n signal, sig ｴevaluｴe aux instants dｴefinis dans un vecteur t :
 sigfc_c1 = lsim(tf(numc_c1,denc_c1),sig,t);
 sigfd_c1 = filter(numd_c1,dend_c1,sig);
 %Analyse frequentielle d'un signal apres filtrage:
%     figure(3)
%     ffc = [0:length(sigfc)-1]*(fe/length(sigfc));
%     fmin = 100; fmax = 600; ymax = 0.6;
%     Sfc = fft(sigfc)/fe;  plot(ffc, abs(Sfc));  axis([fmin fmax 0 ymax]); hold on;
    
 %% Chabyshev de type 2:
[nc_c2, wnc_c2]= cheb2ord(2*pi*fp,2*pi*fa,Ap,Aa,'s'); % en analogique
[nd_c2, wnd_c2]= cheb2ord(2*fp/fe,2*fa/fe,Ap,Aa); % en discret
% fp et fa auront deux composantes pour un passe/coupe-bande
% Calcul des coefficients de la fonction de transfert : butter, cheby1, cheby2 ou ellip.
 [numc_c2, denc_c2] = cheby2(nc_c2,Aa,wnc_c2,'low','s');% en analogique
 [numd_c2, dend_c2] = cheby2(nd_c2,Aa,wnd_c2,'low'); % en discret
 
% Calcul de la rｴeponse frｴequentielle du filtre : freqs, freqz
 figure(2)
 f = linspace(fmin,fmax,1000);
 Hc_c2 = freqs(numc_c2,denc_c2,2*pi*f); plot(f,20*log10(abs(Hc_c2))); hold on;
 Hd_c2 = freqz(numd_c2,dend_c2,f,fe); plot(f,20*log10(abs(Hd_c2)));
% Filtrage d置n signal, sig ｴevaluｴe aux instants dｴefinis dans un vecteur t :
 sigfc_c2 = lsim(tf(numc_c2,denc_c2),sig,t);
 sigfd_c2 = filter(numd_c2,dend_c2,sig);
%  %Analyse frequentielle d'un signal apres filtrage:
%     figure(3)
%     ffc = [0:length(sigfc)-1]*(fe/length(sigfc));
%     fmin = 100; fmax = 600; ymax = 0.6;
%     Sfc = fft(sigfc)/fe;  plot(ffc, abs(Sfc));  axis([fmin fmax 0 ymax]); hold on;
%     
 %% Chabyshev de ellipe:
[nc_el, wnc_el]= ellipord(2*pi*fp,2*pi*fa,Ap,Aa,'s'); % en analogique
[nd_el, wnd_el]= ellipord(2*fp/fe,2*fa/fe,Ap,Aa); % en discret
% fp et fa auront deux composantes pour un passe/coupe-bande
% Calcul des coefficients de la fonction de transfert : butter, cheby1, cheby2 ou ellip.
 [numc_el, denc_el] = ellip(nc_el,Ap,Aa,wnc_el,'low','s');% en analogique
 [numd_el, dend_el] = ellip(nd_el,Ap,Aa,wnd_el,'low'); % en discret
 
% Calcul de la rｴeponse frｴequentielle du filtre : freqs, freqz
 figure(2)
 f = linspace(fmin,fmax,1000);
 Hc_el = freqs(numc_el,denc_el,2*pi*f); plot(f,20*log10(abs(Hc_el))); hold on;
 Hd_el = freqz(numd_el,dend_el,f,fe); plot(f,20*log10(abs(Hd_el)));
% Filtrage d置n signal, sig ｴevaluｴe aux instants dｴefinis dans un vecteur t :
 sigfc_el = lsim(tf(numc_el,denc_el),sig,t);
 sigfd_el = filter(numd_el,dend_el,sig);
%  %Analyse frequentielle d'un signal apres filtrage:
%     figure(3)
%     ffc = [0:length(sigfc)-1]*(fe/length(sigfc));
%     fmin = 100; fmax = 600; ymax = 0.6;
%     Sfc = fft(sigfc)/fe;  plot(ffc, abs(Sfc));  axis([fmin fmax 0 ymax]); hold on;
 