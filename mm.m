close all;

col = {'b-','g-','r-','k-','m-'};
xSteps = 250;
dx = 10/xSteps;
C = [0.5 0.7 1 1.2 1.5];
for j = 1:5
    ratio = [0.3 0.3 0.3 0.3 0.3];
    dt = ratio(j)*dx;
    [Q,x,t,cons] = adv(xSteps,ratio(j),4,C(j),0.1);
    T = [0 0.5 1 1.6 2.1 2.6 3.1 3.5 4];
    titre = sprintf('Height for T = %f', T(2));
    plot(x,Q(:,abs(t-T(2))<= dt/2),col{j});axis([0 10 1 1.1]);xlabel('x');title(titre);hold on;ylabel('Height');
    legend('C0=0.5','C0=0.7','C0=1.0','C0=1.2','C0=1.5');
end
% figure;
% mesh(x,t,Q');