% changer les parametres de ARMAX.
opt = armaxOptions;
opt.Focus = 'simulation';
opt.SearchOption.MaxIter = 100;
opt.Display = 'off';
opt.SearchOption.Tolerance = 1e-10;
disp('gn');
opt.SearchMethod = 'gn';
modmv= armax(data, [3 3 3 1],opt)
disp('lm');
opt.SearchMethod = 'lm';
modmv= armax(data, [3 3 3 1],opt)
disp('gna');
opt.SearchMethod = 'gna';
modmv= armax(data, [3 3 3 1],opt)
disp('grad');
opt.SearchMethod = 'grad';
modmv= armax(data, [3 3 3 1],opt)
disp('lsqnonlin');
opt.SearchMethod = 'lsqnonlin';
modmv= armax(data, [3 3 3 1],opt)
disp('auto');
opt.SearchMethod = 'auto';
modmv= armax(data, [3 3 3 1],opt)

