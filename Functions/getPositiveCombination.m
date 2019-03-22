function [w,err,t] = getPositiveCombination(P,c)

% number of points
N = size(P,1);

%looking for solutions P*w = center and with sum(w) = 1
Aeq = [P' zeros(2,1); ones(1,N), 0];
beq = [c'; 1];
% let s be slack var that bounds w from below
%w >= s --> s-w<= 0 
Aineq = [-eye(N), ones(N,1)];
bineq = zeros(N,1);
% objective singles out the slack var s
f = [zeros(N,1); -1];
% solve linear program
sol = linprog(f,Aineq,bineq,Aeq,beq);
w = sol(1:end-1);
t = sol(end);
%check that the w's we got satisfy w*P = center
err = norm(w'*P-c);
