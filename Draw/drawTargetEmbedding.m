figure;
patch('vertices',X,'faces',F,'facecolor',0.9*[1 1 1]);
hold on;
quiver(X(:,1),X(:,2),G(:,1),G(:,2));
drawVertexNumbers(X,drawLabels);
drawEdgeWeights(X,W,drawLabels);
axis equal; axis off;
title(sprintf('(X,F) -- embedding of given triangulation with weights W and boundary P\narrows showing G, the action of the Laplacian\nwe want to prove that this embedding is injective'));
