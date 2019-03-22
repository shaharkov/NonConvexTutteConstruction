function [X, G, bndInd] = solveDiscreteLaplace(W, P)

% get boundary indices (entries wherein P is not nan)
bndInd = any(~isnan(P),2);

% set up Laplacian
L = W - diag(sum(W,2));

% aux matrix
I = eye(size(L));

% set up linear system:
% LHS:
LHS = zeros(size(L));
LHS(~bndInd,:) = L(~bndInd,:);
LHS(bndInd,:) = I(bndInd,:);
% RHS:
RHS = zeros(size(L,1),2);
RHS(bndInd,:) = P(bndInd,:);

% solve linear system
X = LHS\RHS;

% compute the action of the Laplacian (analog to the gradient)
G = L*X;