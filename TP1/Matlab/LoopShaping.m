clc; clear;


%% A) Filtrage pas-bas analogique
 Ap = 3 ; Aa = 30 ; fc = 425; Df=100;
 
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



