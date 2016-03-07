
L = 10;
H = 1;
g = 9.61;
w = 0.4;
epsilon = 0.1;
x=0:0.01:L;
close all;
plot(x,0.5*(2*H + epsilon *exp(-(x+3.1-L/2).^2/w^2) + epsilon* exp(-(x-3.1-L/2).^2/w^2)),'k.','MarkerSize',10)
hold on
T = 1; i = 1;
ratio = 0.322;
xSteps = 303;
dx = 10/xSteps;
dt = ratio*dx;

[Q,x,t,cons] = advLinear(xSteps,ratio,4);
[R,y,g,blaf] = adv(xSteps,0.3,4,1,0.1);
plot(x,Q(:,abs(T(i)-t)<dt/2-eps),'b-',y,R(:,abs(T(i)-t)<dt/2-eps),'r--');
title('Analytical Solution at T=1')
xlabel('x (m)')
ylabel('Height (m)')
legend('analytical','linear','non-linear')