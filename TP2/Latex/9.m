%% Filtre RIF de longueur minimale (fenetre de Kaiser) :
%% A) L'ordre de chaque filtre:
 ep = 1-10^(-Ap/20); da = 10^(-Aa/20);
 [n,wc,beta] = kaiserord([fp_b fa_b fp_h fa_h],[1 0 1],[ep da ep],fe);
 %% B) La fenetre:
 h = fir1(n,wc,'stop',kaiser(n+1,0.5),'noscale') ;
 %% D1) La reponse frequentielle du filtre de Kaiser:
%f = linspace(fmin,fmax,1000);
[HK,f] = freqz(h,1,f,fe);
figure(5)
plot(f,20*log10(abs(HK))); axis([fmin fmax -70 10]);

%% C) Tracer l allure temporelle  de l agamme filtree
 figure(6)
 Filtered_Kaiser = filter(h,1,sig);
 plot(t,Filtered_Kaiser);title('Filtered_Kaiser');
 %Analyse frequentielle d'un signal apres filtrage:
    figure(6)
    ffc = [0:length(Filtered_Kaiser)-1]*(fe/length(Filtered_Kaiser));
    fmin = 250; fmax = 600; ymax = 0.6;
    Sfc = fft(Filtered_Kaiser)/fe;  plot(ffc, abs(Sfc));  axis([fmin fmax 0 ymax]); hold on;
    %% Listen:
   soundsc(Filtered_Kaiser, fe)
