%% 2) simulation de la process:
N = 1000; Te = 0.02 ; a=5; b=4; sigma = 0.4;
perturbation = true;
[data, modex] = simulsyst(N,Te,a,b,sigma,perturbation);
plot(data);

%le degre de persistance:
Ped = pexcit(data);
