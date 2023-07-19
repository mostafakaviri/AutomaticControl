clear;clc;
num=[ 0.179 ];
den=[ 1 0 -0.179 ];
% open loop GH
H=1;
GH = tf(num,den)

rlocus(GH);
grid on
