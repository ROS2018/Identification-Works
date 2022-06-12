%% B) Les coefficients de chaque filtre:
% Butterworth:
[numc_b, denc_b] = butter(nc_b,wnc_b,'low','s');% en analogique
% Chabyshev de type 1:
[numc_c1, denc_c1] = cheby1(nc_c1,Ap,wnc_c1,'low','s');% en analogique
% Chabyshev de type 2:
[numc_c2, denc_c2] = cheby2(nc_c2,Aa,wnc_c2,'low','s');% en analogique
% Chabyshev de ellipe:
[numc_el, denc_el] = ellip(nc_el,Ap,Aa,wnc_el,'low','s');% en analogique
H_ellip = tf(numc_el, denc_el);
