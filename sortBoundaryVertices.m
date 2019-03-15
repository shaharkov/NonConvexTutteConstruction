function T_out = sortBoundaryVertices(T)

% get boundary / interior
B = T.freeBoundary;
B = B(:,1)';
INT = setdiff(1:size(T.Points,1),B);

% prepare maps
v_ind = [B, INT];
map(v_ind) = 1:length(v_ind);

% output sorted triangulation
T_out = triangulation(map(T.ConnectivityList), T.Points(v_ind,:));
