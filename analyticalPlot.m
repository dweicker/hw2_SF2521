L = 10;
H = 1;
g = 9.61;
w = 0.4;
epsilon = 0.1;
x=0:0.01:L;
close all;
plot(x,0.5*(2*H + epsilon *exp(-(x+3.1-L/2).^2/w^2) + epsilon* exp(-(x-3.1-L/2).^2/w^2)))
title('Analytical Solution at T=1')
xlabel('x (m)')
ylabel('Height (m)')