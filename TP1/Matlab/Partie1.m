clc; clear;
duree = 1; fe=8192;
[sig,t] = gamme(duree, fe);
soundsc(sig, fe)

%Analyse frequentielle du signal avant filtrage:
f = [0:length(sig)-1]*(fe/length(sig));
fmin = 200; fmax = 600; ymax = 0.6
figure(1)
S = fft(sig)/fe; plot(f, abs(S)); axis([fmin fmax 0 ymax]);

%% A) Filtrage pas-bas analogique
 Ap = 3 ; Aa = 50 ; fc = 425; Df=60;
% Ap = 3 ; Aa = 40 ; fc = 420; Df=100;
%Ap = 1 ; Aa = 40 ; fc = 420; Df=20;

fp = fc-Df/2;
fa = fc + Df/2;

%% L'ordre de chaque filtre:
% Butterworth:
[nc_b, wnc_b]= buttord(2*pi*fp,2*pi*fa,Ap,Aa,'s'); % en analogique
% Chabyshev de type 1:
[nc_c1, wnc_c1]= cheb1ord(2*pi*fp,2*pi*fa,Ap,Aa,'s'); % en analogique
% Chabyshev de type 2:
[nc_c2, wnc_c2]= cheb2ord(2*pi*fp,2*pi*fa,Ap,Aa,'s'); % en analogique
% Chabyshev de ellipe:
[nc_el, wnc_el]= ellipord(2*pi*fp,2*pi*fa,Ap,Aa,'s'); % en analogique

%% B) Les coefficient de chaque filtre:
% Butterworth:
[numc_b, denc_b] = butter(nc_b,wnc_b,'low','s');% en analogique
% Chabyshev de type 1:
[numc_c1, denc_c1] = cheby1(nc_c1,Ap,wnc_c1,'low','s');% en analogique
% Chabyshev de type 2:
[numc_c2, denc_c2] = cheby2(nc_c2,Aa,wnc_c2,'low','s');% en analogique
% Chabyshev de ellipe:
[numc_el, denc_el] = ellip(nc_el,Ap,Aa,wnc_el,'low','s');% en analogique

    H_Butter = tf(numc_b, denc_b)
    H_Ch1 = tf(numc_c1, denc_c1)
    H_Ch2 = tf(numc_c2, denc_c2)
    margin(H_Butter)
    H_ellip = tf(numc_el, denc_el)
    %margin(H_ellip);

%% C) Les reponses fréquentielles de chaque filtres analogique;
 f = linspace(fmin,fmax,1000);
 Hc_b = freqs(numc_b,denc_b,2*pi*f);  
 Hc_c1 = freqs(numc_c1,denc_c1,2*pi*f);  
 Hc_c2 = freqs(numc_c2,denc_c2,2*pi*f); 
 Hc_el = freqs(numc_el,denc_el,2*pi*f); 
 
 graph = plot(f,20*log10(abs(Hc_b)),f,20*log10(abs(Hc_c1)),f,20*log10(abs(Hc_c2)),f,20*log10(abs(Hc_el)));
 legend(graph,'Butterworth','Chabyshev de type 1','Chabyshev de type 2','Cauer')

%% D) Appliquer les filtres au signal audio synth´etique :
Filtered_ButterWorth = lsim(tf(numc_b,denc_b),sig,t);
soundsc(Filtered_ButterWorth, fe);
Filtered_Cheb1 = lsim(tf(numc_c1,denc_c1),sig,t);
soundsc(Filtered_Cheb1, fe);
Filtered_Cheb2 = lsim(tf(numc_c2,denc_c2),sig,t);
soundsc(Filtered_Cheb2, fe);
Filtered_Cauer = lsim(tf(numc_el,denc_el),sig,t);
soundsc(Filtered_Cauer, fe);

%% E1) Tracer sur la meme figure l allure temporelle et le spectre d amplitude de lagamme filtree
figure(2);
subplot(2,2,1); plot(t,Filtered_ButterWorth);title('ButterWorth');
subplot(2,2,2); plot(t,Filtered_Cheb1);title('Cheb1');
subplot(2,2,3); plot(t,Filtered_Cheb2);title('Cheb2');
subplot(2,2,4); plot(t,Filtered_Cauer);title('Cauer');

 legend(graph,'Butterworth','Chabyshev de type 1','Chabyshev de type 2','Cauer')

%% E2) Le spectre d'amplitude de la gamme filtrée

fmin = 250; fmax = 550; ymax = 0.6;
ButterW = fft(Filtered_ButterWorth)/fe;  
Cheb1 = fft(Filtered_Cheb1)/fe;  
Cheb2 = fft(Filtered_Cheb2)/fe;  
Cauer = fft(Filtered_Cauer)/fe; 

figure(3);
ffc = [0:length(ButterW)-1]*(fe/length(ButterW));
subplot(2,2,1); plot(ffc,abs(ButterW));title('ButterWorth');
axis([fmin fmax 0 ymax]); 
subplot(2,2,2); plot(ffc,abs(Cheb1));title('Cheb1');
axis([fmin fmax 0 ymax]); 
subplot(2,2,3); plot(ffc,abs(Cheb2));title('Cheb2');
axis([fmin fmax 0 ymax]); 
subplot(2,2,4); plot(ffc,abs(Cauer));title('Cauer');
axis([fmin fmax 0 ymax]); 


