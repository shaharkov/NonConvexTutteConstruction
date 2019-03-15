function [F_add,P_ext] = extendTriangulation(P,conn)

% compute the convex hull and triangulate the difference
pgon = polyshape(P(conn,:)); % make into polygon
pgon_convex_hull = pgon.convhull; % compute convex hull
pgon_add = subtract(pgon_convex_hull, pgon); % subtract from convex hull
T = pgon_add.triangulation; % triangulate

% map back to original indices
map = knnsearch(P,T.Points);
F_add = reshape(map(T.ConnectivityList), size(T.ConnectivityList));

% compute the new boundary polygon
P_ext_ind = knnsearch(P, pgon_convex_hull.Vertices);
P_ext = nan(size(P));
P_ext(P_ext_ind,:) = P(P_ext_ind,:);


% % debug
% figure;
% plot(pgon);
% 
% figure;
% plot(pgon_add)
% 
% figure;
% triplot(T);
% axis equal;
% 
% figure;
% triplot(F_add,P(conn,1),P(conn,2)); % since boundary are sorted first
