function [data , ModelExact] = simulsyst(N,Te,a,b,sigma,perturbation)

A= [1 -2.35 1.88 -0.51];
B = [0 -0.02 0.02 0.02];
C = [1 -1.66 0.83 -1.32];
D = 1 ;
F = 1 ;
ModelExact = idpoly(A,B,C,D,F,sigma,Te);

% sequence binaire pseudo-aleatoire 
U = idinput(N,'PRBS',[0 1/b],[-a a]);

options = simOptions('AddNoise',perturbation);
Y = sim(ModelExact, U, options);
data  = iddata( Y,U,Te) ;

end

