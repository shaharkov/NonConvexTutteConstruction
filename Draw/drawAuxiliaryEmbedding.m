figure;
patch('vertices',U,'faces',F_ext,'facecolor',0.9*[1 1 1]);
hold on;
drawVertexNumbers(U,drawLabels);
drawEdgeWeights(U,W_ext_uniform,drawLabels);
axis equal; axis off;
title(sprintf('(U,F'') -- embedding of the extended triangulation using Tutte\n(uniform weights; boudnary vertices uniformly spaced on the circle)'));
