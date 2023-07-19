clear;clc;

% For G ;open looped transfer function 
num=[ 0.179 ];
den=[ 1 0 -0.179 ];
G = tf(num,den)
nyquist(G);
grid on
