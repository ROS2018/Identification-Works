%% Chabyshev de type 2:
Df = 10;
fc_b = 340;
fc_h=360;
% Df = 5;
% fc_b = 345;
% fc_h=355;

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
%% C) Les reponses frequentielles;
 figure(2)
 f = linspace(fmin,fmax,1000);
 Hd_c2 = freqz(numd_c2,dend_c2,f,fe); plot(f,20*log10(abs(Hd_c2)));
