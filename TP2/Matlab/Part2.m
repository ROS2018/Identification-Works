%clc,clear;
%% Do the experiment:
load('tergane20.mat')

%% Creat an object of data:
Te = 1/1000;
data = iddata(z,yc,Te);
plot(data);

%% Identification:
nb=3 ; nf=3; nk = 0;
modoe = tf(oe(data, [nb nf nk]));
Fs = tf(d2c(modoe,'zoh'));

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
%% Using the methode of identc:
F_identc=identc(data,[3 1 0], [3 1 0],'gpmfn', 100, 'final');
% B(s) = 7524 s + 228.2                                 
% F(s) = s^3 + 312 s^2 + 2.068e04 s + 1.383e06 
aa_=2.068e04;
b0_ = 228.2/aa_;
b1_ = 7524/aa_;
a3_ = 1/aa_; a2_ = 312 /aa_; a1_ = 1; a0_ = 1.383e06/aa_;
F_ = tf([b1_ b0_*0],[a3_ a2_ a1_ a0_])
% Validation:
figure(3);
compare(data,F_identc,F_);

%% Les parametres:
P_= 2.90;
Kz_ = b1_ / P_
Ky_ = a0_/P_
T_1 = (a2_+sqrt(a2_^2-4*a3_))/2
T_2 = a2_-T_1 

%% 4) 
% initial values:
T1 = 1;
T2 = 1;
Ky = 1;
Kz= 1;
parameters = {'T1',T_1;'T2',T_2;'Ky',Ky_;'Kz',Kz_};
sysI=idgrey('Maquette',parameters,'c');
sys=pem(data,sysI)
compare(data,sysI)
b2 = 8400;
a1 = 350 ; a2 = 2.253e04; a3=  1.549e06;
Kz= b2 / P/a2
Ky = a3/P/a2
T1 = (a1/a2+sqrt((a1/a2)^2-4/a2))/2
T2 = 1/a2/T1 
