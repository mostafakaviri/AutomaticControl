clear;clc;

% For Gc . G ;Compensated open looped transfer function rootlocus
figure 
GH_unCompensated=tf([0.179],[1 0 -0.179])
Gc_up=[1 -(0.179^0.5)];
Gc_down=[1 2.577];
num=conv(Gc_up,[0.179]);
den=conv(Gc_down,[1 0 -0.179]);
GH_Compensated = tf(num,den)
rlocus(GH_Compensated);
sgrid([0.75] , [2])
axis([-3 1 -5 5])

%Compensated & unCompensated step response
figure 
K=16.3
T_Compensated=K*GH_Compensated/(1+K*GH_Compensated)
poles_of_T_Compensated=pole(T_Compensated)
step(T_Compensated)
hold on
step(GH_unCompensated/(1+GH_unCompensated))
axis([0 10 0 1])
legend('Compensated','UnCompensated')
title('System response to unit step input')
grid on

%System response to 2*unit step input
figure
t=0:0.01:5;
temp=t;
temp(:,:)=2;
u=temp;
lsim(T_Compensated,u,t)
title('System response to 2*unit step input')
grid on

% System response to sin input
figure
t=0:0.01:5;
u=sin(2*pi*t);
lsim(T_Compensated,u,t)
title('System response to sin input')
grid on

% bode & nyquist For G_Compensated open looped transfer function 
figure
w=logspace(-1,2);
bode(GH_Compensated,w);
[Gm pm wcp wcg]=margin(GH_Compensated)
GmdB=20*log10(Gm)
grid on
figure
nyquist(GH_Compensated);
grid on

