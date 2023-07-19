clear;
clc;

I0=1.4*10^(-5)    ;      %kg.m^2
R=0.01            ;      %m
d=0.025           ;      %m
L=1               ;      %m

% define the state-space model

% dz=[0,1 ; 0,0] * z + [0 ; (d*R^2)/(L*I0)] * theta

A=[0,1 ; 0,0] ;
B=[0 ; (d*R^2)/(L*I0)] ;
C=[1 , 0];
D=0 ;

G=ss(A,B,C,D);

% sin function

t=0:0.01:5;
u=sin(2*pi*t);
lsim(G,u,t)
grid on
xlim([0 5]);
ylim([0 0.2]);
ylabel('r displacement (m)');
