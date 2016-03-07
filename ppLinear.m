[Q,x,t,cons] = advLinear(500,0.2,10);
figure(2)
T = [0 90 180 260 360 450 510 630 667];
for i = 1:9
    subplot(3,3,i);
    titre = sprintf('Height for T = %f', T(i)*4/(length(t)-1));
    plot(x,Q(:,T(i)+1));axis([0 10 1 1.11]);xlabel('x');title(titre);
end