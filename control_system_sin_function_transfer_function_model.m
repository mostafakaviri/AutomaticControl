clear;
clc;



I0=1.4*10^(-5)    ;      %kg.m^2
R=0.01            ;      %m
d=0.025           ;      %m
L=1               ;      %m

num=(d*R^2)/(L*I0);
den=[1,0,0];
G=tf(num,den)

t=0:0.01:5;
u=sin(2*pi*t);
lsim(G,u,t)
grid on
xlim([0 5]);
ylim([0 0.2]);
ylabel('r displacement (m)');
