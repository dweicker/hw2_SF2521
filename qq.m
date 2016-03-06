close all;

ratio = 0.19;
xSteps = 300;
dx = 10/xSteps;
dt = ratio*dx;
[Q,x,t,cons] = adv(xSteps,ratio,4,1,1.2);

T = [0 0.5 1 1.2 1.9 2.6 3.1 3.5 4];
for i = 1:9
    subplot(3,3,i);
    titre = sprintf('Height for T = %f', T(i));
    plot(x,Q(:,abs(t-T(i))<= dt/2));axis([0 10 1 2.2]);xlabel('x');title(titre);
end
figure;
mesh(x,t,Q');