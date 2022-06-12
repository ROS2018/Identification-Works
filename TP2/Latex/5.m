%% Filter and listen:
Filtred_Signal_ButterWorth = lsim(tf(numc_b,denc_b),sig,t);
soundsc(Filtred_Signal_ButterWorth, fe);
Filtred_Signal_Cheb1 = lsim(tf(numc_c1,denc_c1),sig,t);
soundsc(Filtred_Signal_Cheb1, fe);
Filtred_Signal_Cheb2 = lsim(tf(numc_c2,denc_c2),sig,t);
soundsc(Filtred_Signal_Cheb2, fe);
Filtred_Signal_Cauer = lsim(tf(numc_el,denc_el),sig,t);
soundsc(Filtred_Signal_Cauer, fe);

