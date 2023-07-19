clear;clc;

% For G ;open looped transfer function 
num=[ 0.179 ];
den=[ 1 0 -0.179 ];
G = tf(num,den)
w=logspace(-1,2);
bode(G,w);
[Gm pm wcp wcg]=margin(G)
GmdB=20*log10(Gm)
grid on
