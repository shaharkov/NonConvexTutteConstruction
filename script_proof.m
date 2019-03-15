%% init
clear
close all


%% Given
[V,F,P,W] = generateProblem_SmallExample();
% rng(1)
% [V,F,P,W] = generateProblem_RandomExample(90,30);

% V - nx2 matrix of the location of n vertices
% F - mx3 matrix where the i'th row contains the indices of the i'th triangle
% P - nx2 matrix with boundary contraints (setting the coordinates of vertices)
%         vertices that are not constrained (interior) are NaN
% W - nxn weighted adjacency matrix - the i,j entry is the weight of the edge connecting i to j (zero if no edge)
%
% We assume that the problem is set up such that the cone condition holds.


%% Compute embedding into P (E1)
% solve a Laplace linear system with weights W and boundary constraints P
% return
[X, G, bndInd] = solveDiscreteLaplace(W, P);


%% classify boundary vertices into convex/reflex
[bndIndReflex,bndIndConvex] = classifyReflexConvex(P, find(bndInd));


%% extend the triangulation
% extend the triangulation by adding ONLY new triangles (=edges)
[F_add, P_ext] = extendTriangulation(P, find(bndInd));

% the extended triangulation is the concatenation of the original triangles
% and the triangulation of the difference between the convex hull of P and
% P itself
F_ext = [F; 
         F_add];   


%% compute an embedding (drawing) of the extended triangulation
% use Tutte (uniform weights), boudnary vertices uniformly spaced on the circle
W_ext_uniform = computeUniformWeights(F_ext);
P_ext_uniform = mapPolygonToCircle(P_ext);

% embed
[X_ext_uniform, G_ext_uniform, bndInd_ext] = solveDiscreteLaplace(W_ext_uniform, P_ext_uniform);


%% construct weights and embed
% find weights on the extended triangulation for which the embedding (onto the convex hull)
% coincides with the desired embedding (onto the non-convex polygon)
% (correponding to the cases in the proof)
W_ext_construction = constructWeightsOnExtension(bndInd, bndInd_ext, bndIndConvex, bndIndReflex, ...
    W, W_ext_uniform,...
    X, P, G);

% embed
[X_ext_construction, G_ext_construction, ~] = solveDiscreteLaplace(W_ext_construction, P_ext);


%% plot
drawAllFigures()
