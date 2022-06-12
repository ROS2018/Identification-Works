graph = plot(f,20*log10(abs(Hc_b)),f,20*log10(abs(Hc_c1)),f,20*log10(abs(Hc_c2)),f,20*log10(abs(Hc_el)));
 legend(graph,'Butterworth','Chabyshev de type 1','Chabyshev de type 2','Cauer')
