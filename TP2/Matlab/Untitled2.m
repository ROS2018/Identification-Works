% ans =
%  
%   A = 
%            x1      x2      x3
%    x1    -312  -161.6  -84.41
%    x2     128       0       0
%    x3       0     128       0
%  
%   B = 
%        u1
%    x1   8
%    x2   0
%    x3   0F_
%  
%   C = 
%           x1     x2     x3
%    y1      0  7.348      0
%  
%   D = 
%        u1
%    y1   0

% b1 = 0.3638/4.836e-05;
% a3 = 66.88/4.836e-05;
% a2=1/4.836e-05;
% a1=0.01509/4.836e-05;
% 
% b1 = 0.3638/4.836e-05;
% a3 = 66.88/4.836e-05;
% a2=1/4.836e-05;
% a1=0.01509/4.836e-05;
% FF = tf([0 b1 0],[1 a1 a2 a3])


FFF = tf([Kz_*P 0],[T_1*T_2 T_1+T_2 1 Ky_*P])






ss