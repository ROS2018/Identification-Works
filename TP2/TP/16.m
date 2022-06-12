% initial values:
T1 = 1;
T2 = 1;
Ky = 1;
Kz= 1;
parameters = {'T1',T_1;'T2',T_2;'Ky',Ky_;'Kz',Kz_};
sysI=idgrey('Maquette',parameters,'c');
sys=pem(data,sysI)
compare(data,sysI,sys)
b2 = 8400;
a1 = 350 ; a2 = 2.253e04; a3=  1.549e06;
Kz= b2 / P/a2
Ky = a3/P/a2
T1 = (a1/a2+sqrt((a1/a2)^2-4/a2))/2
T2 = 1/a2/T1
