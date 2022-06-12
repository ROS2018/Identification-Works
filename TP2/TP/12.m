%% Identification:
nb=3 ; nf=3; nk = 0;
modoe = tf(oe(data, [nb nf nk]));
Fs = tf(d2c(modoe,'zoh'));
