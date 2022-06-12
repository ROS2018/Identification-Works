%% aproximation:
aa =  3.684e04;
b0 = 1536/aa;
b1 = 1.498e04/aa;
a0 = 2.818e06/aa;
a1=1;
a2 = 605.7/aa;
a3 = 1/aa;
F= tf([b1 b0*0],[a3 a2 a1 a0])

%Validation:
figure(2);
compare(data,modoe, F);
% Les parametres:
P= 2.90
Kz = b1 / P
Ky = a0/P
T1 = (a2+sqrt(a2^2-4*a3))/2
T2 = a2-T1
compare(data,modoe,Fs);
