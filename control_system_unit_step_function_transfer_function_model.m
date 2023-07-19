clear;
clc;



I0=1.4*10^(-5)    ;      %kg.m^2
R=0.01            ;      %m
d=0.025           ;      %m
L=1               ;      %m

num=(d*R^2)/(L*I0);
den=[1,0,0];
G=tf(num,den)
step(G)
grid on
xlim([0 5]);
ylabel('r displacement (m)');