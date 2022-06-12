figure(2);
subplot(2,2,1); plot(t,Filtered_Signal_ButterWorth);title('ButterWorth');
subplot(2,2,2); plot(t,Filtered_Signal_Cheb1);title('Cheb1');
subplot(2,2,3); plot(t,Filtered_Signal_Cheb2);title('Cheb2');
subplot(2,2,4); plot(t,Filtered_Signal_Cauer);title('Cauer');

 legend(graph,'Butterworth','Chabyshev de type 1','Chabyshev de type 2','Cauer')
