Ap = 3 ; Aa = 40 ; fc = 420; Df=100;
fp = fc-Df/2;
fa = fc + Df/2;
%% Chabyshev de type 2:
[nd_c2, wnd_c2]= cheb2ord(2*pi*fp/fe,2*pi*fa/fe,Ap,Aa); % en discret
% fp et fa auront deux composantes pour un passe/coupe-bande
% Calcul des coefficients de la fonction de transfert : butter, cheby1, cheby2 ou ellip.
 [numd_c2, dend_c2] = cheby2(nd_c2,Aa,wnd_c2,'low'); % en discret
 
% Calcul de la r´eponse fr´equentielle du filtre : freqs, freqz
 figure(2)
 f = linspace(fmin,fmax,1000);
 Hd_c2 = freqz(numd_c2,dend_c2,f,fe); plot(f,20*log10(abs(Hd_c2)));