function [A, B ,C ,D] = Maquette(T_1,T_2,Ky_,Kz_,Ts)
P = 2.9;

a1 = 1/T_1 + 1/T_2;
a2 = 1/T_2/T_1;
a3 = Ky_*P/T_1/T_2;

b1=0;
b2 = Kz_*P/T_1/T_2;
b3 = 0;

A= [-a1 -a2 -a3
    1 0 0
    0 1 0];

B = [b2;0;0];

C = [0 1 0];

D = 0;

end


