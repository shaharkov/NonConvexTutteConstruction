function P_uniform = mapPolygonToCircle(P)

% get valid indices (entries wherein P is not nan)
bndInd = any(~isnan(P),2);

% map to circle
theta = linspace(0,2*pi,nnz(bndInd)+1);
theta = theta(1:end-1)';
P_uniform = nan(size(P));
P_uniform(bndInd,:) = [cos(theta), sin(theta)];
