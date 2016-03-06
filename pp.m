[Q,x,t,cons] = adv(500,0.3,4,1,0.1);

T = [0 90 180 260 360 450 510 630 667];
for i = 1:9
    subplot(3,3,i);
    titre = sprintf('Height for T = %f', T(i)*4/(length(t)-1));
    plot(x,Q(:,T(i)+1));axis([0 10 1 1.11]);xlabel('x');title(titre);
end