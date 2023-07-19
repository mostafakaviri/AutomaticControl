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

%unit step function

step(G)
grid on
xlim([0 5]);
ylabel('r displacement (m)');
