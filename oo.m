close all;

ratio = 0.3;
xSteps = 300;
dx = 10/xSteps;
dt = ratio*dx;
[Q,x,t,cons] = noReflex(xSteps,ratio,2.1);

T = [0 0.7 1.4 2.1];
for i = 1:4
    subplot(2,2,i);
    titre = sprintf('Height for T = %f', T(i));
    plot(x,Q(:,abs(t-T(i))<= dt/2));axis([0 10 1 1.1]);xlabel('x');title(titre);
end
figure;
mesh(x,t,Q');

