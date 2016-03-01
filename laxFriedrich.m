function [ ] = laxFriedrich( xSteps, tSteps )
%Problem 2.1 Lax-Friedrich method
T = 10;%pick final time
%given variables
L = 10;
H = 1;
g = 9.61;
w = 0.4;
epsilon = 0.1;
%calculate stepsizes
dx = L/xSteps;
dt = T/tSteps;

%flux function
f = @(u) [ u(2) , u(2)^2/u(1) + 0.5*g*u(1)^2];
%Lax-Friedrich flux function
FLxF = @(u2,u1) (0.5*(f(u2)+f(u1) - dx/dt*(u2-u1)));

%Initial Conditions
Q = zeros(xSteps+1, 2*(tSteps+1));
Q(2:(end-1),1) = H+epsilon*exp(-((dx:dx:(L-dx)) - L/2).^2/w^2);

F = zeros(xSteps,2);
for i = 1:tSteps+1
    % Ghost point values
    Q(1,2*i-1) = Q(2,2*i-1);
    Q(1,2*i) = -Q(2,2*i);
    Q(end,2*i-1) = Q(end-1,2*i-1);
    Q(end,2*i) = -Q(end-1,2*i);
    
    for j = 2:xSteps+1
        
        F(j,:) = FLxF( Q(j,(2*i-1):(2*i)), Q(j-1,(2*i-1):(2*i)) );
        
        if j > 2
            Q( j-1, 2*(i+1)-1:2*(i+1) ) = Q( j-1, 2*i-1:2*i ) - dt/dx*(F(j,:)-F(j-1,:));
        end
        
    end
    
end
mesh(Q(:,2*(1:tSteps+1)-1))
%mesh(0:dx:L, (0:dt:T)', Q(:,2*(1:tSteps+1)-1))
rotate3d on
end

