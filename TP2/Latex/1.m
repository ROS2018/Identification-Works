%% L'ordre de chaque filtre:
%% Butterworth:
[nc_b, wnc_b]= buttord(2*pi*fp,2*pi*fa,Ap,Aa,'s'); % en analogique
%% Chabyshev de type 1:
[nc_c1, wnc_c1]= cheb1ord(2*pi*fp,2*pi*fa,Ap,Aa,'s'); % en analogique
%% Chabyshev de type 2:
[nc_c2, wnc_c2]= cheb2ord(2*pi*fp,2*pi*fa,Ap,Aa,'s'); % en analogique
%% Chabyshev de ellipe:
[nc_el, wnc_el]= ellipord(2*pi*fp,2*pi*fa,Ap,Aa,'s'); % en analogique
