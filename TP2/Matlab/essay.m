function [A,B,C,D] = essay(m,g,l,b)
A = [0 1; -g/l, -b/m/l^2];
B = zeros(2,0);
C = [1 0];
D = zeros(1,0);
end 
% function [A ,B ,C ,D] = essay(a ,b ,c ,d)
% 
% A =a;
% B=b;
% C=c;
% D=0;
% 
% end
% 
