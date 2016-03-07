ratio = 0.322;
xSteps = 103;
dx = 10/xSteps;
dt = ratio*dx;

[Q,x,t,cons] = advLinear(xSteps,ratio,4);
[R,y,g,blaf] = adv(xSteps,0.3,4,1,0.1);
figure(2)
T = [0 0.5 1 1.62 2 2.5 3.245 3.5 4];
for i = 1:9
    subplot(3,3,i);
    titre = sprintf('Height for T = %f', T(i));
    plot(x,Q(:,abs(T(i)-t)<dt/2-eps),'b-',y,R(:,abs(T(i)-t)<dt/2-eps),'r--');axis([0 10 1 1.11]);xlabel('x');title(titre);
end
legend('linear','non-linear')