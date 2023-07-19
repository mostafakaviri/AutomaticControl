clear;clc;

% For Gc . G ;Compensated open looped transfer function 
figure 
GH_unCompensated=tf([0.179],[1 0 -0.179])
Gc_up=conv([1 -(0.179^0.5)],[1 0.05])
Gc_down=conv([1 1.83],[1 0.001])
num=conv(Gc_up,[0.179]);
den=conv(Gc_down,[1 0 -0.179]);
GH_Compensated = tf(num,den)
rlocus(GH_Compensated);
sgrid([0.75] , [1.5])
axis([-3 1 -5 5])

%Compensated & unCompensated step response
figure 
K1=8.25
K2=1.03
T_Compensated=K2*K1*GH_Compensated/(1+K2*K1*GH_Compensated)
poles_of_T_Compensated=pole(T_Compensated)
step(T_Compensated)
hold on
step(GH_unCompensated/(1+GH_unCompensated))
axis([0 60 0 1])
legend('Compensated','UnCompensated')
grid on

%system response to 2*unit step input
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