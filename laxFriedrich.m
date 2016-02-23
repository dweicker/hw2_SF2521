function [ ] = laxFriedrich( xSteps, tSteps )
%Problem 2.1 Lax-Friedrich method
T = 4; %pick final time
%given variables
L = 10;
H = 1;
g = 9.61;
w = 0.4;
epsilon = 0.1;
%flux function
f = @(u) [ u(2) ; u(2)^2/u(1) + 0.5*g*u(1)^2];
%Lax-Friedrich flux function
FLxF = @(u2,u1) (0.5*(f(u2)+f(u1) - dx/dt*(u2-u1)));

%Initial Conditions
Q = zeros(xSteps+2, 2*tSteps);
Q(:,1) = H+epsilon*exp(-(0:dx:L - L/2).^2/w^2);

for i = 1:size(tSteps)
    for j = 1:size(xSteps)
    end
end
end

