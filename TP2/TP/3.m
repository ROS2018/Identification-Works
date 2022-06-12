% La reponse frequentielle du systeme:
figure(2)
margin(d2c(modex,'tustin'));

% Le spectre du SBPA :
figure(3)
fe =1/Te;
ffc = (0:length(data.u)-1)*(fe/length(data.u));
fft_u = fft(data.u);
plot(ffc, abs(fft_u/length(data.u)));
% Autocorrelation du SBPA:
[Ruu, Tau] = xcorr(data.u,'unbiased');
plot(Tau,Ruu);
% Le spectre de la sortie:
figure(4)
ffc = fe*(0:length(data.y)-1)/length(data.y);
fft_y = fft(data.y);
plot(ffc, abs(fft_y/length(data.y)));

