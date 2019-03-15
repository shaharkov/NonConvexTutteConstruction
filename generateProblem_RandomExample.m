function [V,F,P,W] = generateProblem_RandomExample(N,K)

% initial triangulation
V = rand(N,2);
DT = delaunayTriangulation(V);

% remove k boundary triangles
T = DT;
for kk = 1:K
    %
    B = T.freeBoundary; % find boundary
    B_edge = B(randi(size(B,1)),:); % select boudnary edge
    B_tri = find(sum(ismember(T.ConnectivityList, B_edge),2)==2);
    % update triangulation
    F = T.ConnectivityList;
    F(B_tri,:) = [];
    T = triangulation(F,V);
    %figure; triplot(T);
end

% remove unreferenced vertices + sort boundary vertices
T = removeUnreferencedVertices(T);
T = sortBoundaryVertices(T);

% set W
L = cotmatrix(T.Points,T.ConnectivityList);
W = full(L-diag(diag(L)));

% set P
B = T.freeBoundary;
P = nan(size(T.Points));
P(B(:,1),:) = T.Points(B(:,1),:);

% set F
F = T.ConnectivityList;

% set V
theta = linspace(0,2*pi,size(B,1)+1);
theta = theta(1:end-1)';
P_circle = nan(size(T.Points));
P_circle(B(:,1),:) = [cos(theta), sin(theta)];
V = solveDiscreteLaplace(W, P_circle);




% figure; 
% triplot(DT);
% 
% figure;
% triplot(triangulation(F,V));
