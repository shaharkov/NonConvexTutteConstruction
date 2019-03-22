function [T_out] = removeUnreferencedVertices(T)

ff = ismember(1:size(T.Points,1), T.ConnectivityList);
map(ff) = 1:nnz(ff);
T_out = triangulation(map(T.ConnectivityList), T.Points(ff,:));
