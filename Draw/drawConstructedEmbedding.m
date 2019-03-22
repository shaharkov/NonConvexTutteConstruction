figure;
patch('vertices',Z,'faces',F_ext,'facecolor',0.9*[1 1 1]);
hold on;
drawVertexNumbers(Z,drawLabels);
drawEdgeWeights(Z,W_ext_construction,drawLabels);
axis equal; axis off;
title(sprintf('(Z,F'') -- embedding of the extended triangulation onto the convex hull of P\nwith weights constructed to coincide with (X,F)'));
