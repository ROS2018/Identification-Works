%% 4)validation par la  fonction validation(data,modid):
clc;
perturbation = false;
[data_no_perturbation, modex_no_perturbation] = simulsyst(N,Te,a,b,sigma,perturbation);
validation(data, data_no_perturbation, modex_no_perturbation,5);
disp('Moindre Carre');
validation(data, data_no_perturbation, modcc,6);
disp('Variabale instrumentale');
validation(data,data_no_perturbation,modiv4,7);
disp('Maximum de vraisemnlance');
validation(data,data_no_perturbation,modmv,8);
disp('Erreure de sortie');
validation(data,data_no_perturbation,modoe,9);
