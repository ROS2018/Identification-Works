%% La reponse frequentielle de chaque filtre analogique:
 f = linspace(fmin,fmax,1000);
 Hc_b = freqs(numc_b,denc_b,2*pi*f);
 Hc_c1 = freqs(numc_c1,denc_c1,2*pi*f);
 Hc_c2 = freqs(numc_c2,denc_c2,2*pi*f);
 Hc_el = freqs(numc_el,denc_el,2*pi*f);

