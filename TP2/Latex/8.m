%% D1) Tracer sur la meme figure l allure temporelle et le spectre d amplitude de lagamme filtree
 figure(3)
 Cheb2 = filter(numd_c2,dend_c2,sig);
 plot(t,Cheb2);title('Cheb2');
 %% D2) Le spectre d'amplitude de la gamme filtree
figure(4)
ffc = [0:length(Cheb2)-1]*(fe/length(Cheb2));
fmin = 100; fmax = 600; ymax = 0.6;
Sfc = fft(Cheb2)/fe;  plot(ffc, abs(Sfc));  axis([fmin fmax 0 ymax]); hold on;
soundsc(Cheb2, fe)
