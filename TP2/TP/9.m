function validation(data,data_no_perturbation,modid,figureNumber)
present(modid);
figure(figureNumber);
subplot(2,1,1);
compare(data_no_perturbation,modid);
subplot(2,1,2);
resid(data,modid);
end

