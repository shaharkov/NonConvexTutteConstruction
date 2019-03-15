%% draw all figures
drawLabels = true;
if size(V,1)>10
    drawLabels = false;
end

% input triangulation
figure;
patch('vertices',V,'faces',F,'facecolor',0.9*[1 1 1]);
hold on;
drawVertexNumbers(V,drawLabels);
axis equal; axis off;
title('(T) Given embedded triangulation');

figure;
patch('vertices',P,'faces',find(bndInd)','edgecolor','r','facecolor','none');
hold on;
drawVertexNumbers(P,drawLabels);
axis equal; axis off;
title('Given mapping of boundary onto a non-convex polygon');

figure;
patch('vertices',P,'faces',find(bndInd)','edgecolor','r','facecolor','none');
hold on;
quiver(X(:,1),X(:,2),G(:,1),G(:,2));
axis equal; axis off;
title(sprintf('Visualizing the assumption: the cone condition holds\n(wrt the solution of Laplace eq with given weights)'));

figure;
patch('vertices',X,'faces',F,'facecolor',0.9*[1 1 1]);
hold on;
quiver(X(:,1),X(:,2),G(:,1),G(:,2));
drawVertexNumbers(X,drawLabels);
drawEdgeWeights(X,W,drawLabels);
axis equal; axis off;
title(sprintf('(E1) Embedding of given triangulation, weights and boundary P\nArrows showing the local force\nWe want to prove that this embedding is injective'));

figure;
patch('vertices',P,'faces',find(bndInd)','edgecolor','r','facecolor','none');
hold on;
patch('vertices',P,'faces',F_add,'facecolor',0.9*[0 1 0],'facealpha',0.6);
axis equal; axis off;
title('Adding triangles to the polygon to extend to the convex hull');

figure;
patch('vertices',V,'faces',F_ext,'facecolor',0.9*[1 1 1]);
hold on;
drawVertexNumbers(V,drawLabels);
axis equal; axis off;
title('Problem: adding this triangle to the original embedding results in intersections')

figure;
patch('vertices',X_ext_uniform,'faces',F_ext,'facecolor',0.9*[1 1 1]);
hold on;
drawVertexNumbers(X_ext_uniform,drawLabels);
drawEdgeWeights(X_ext_uniform,W_ext_uniform,drawLabels);
axis equal; axis off;
title(sprintf('(E2) Embedding of the extended triangulation using Tutte\n(uniform weights; boudnary vertices uniformly spaced on the circle)'));

figure;
patch('vertices',X_ext_construction,'faces',F_ext,'facecolor',0.9*[1 1 1]);
hold on;
drawVertexNumbers(X_ext_construction,drawLabels);
drawEdgeWeights(X_ext_construction,W_ext_construction,drawLabels);
axis equal; axis off;
title(sprintf('(E3) Embedding of the extended triangulation onto the convex hull of P\nwith weights constructed to coincide with original embedding onto P'));


%% single figure summary
figure;
subplot(2,4,1);
patch('vertices',V,'faces',F,'facecolor',0.9*[1 1 1]);
axis equal; axis off; axis tight;
title('(T)');

subplot(2,4,5);
patch('vertices',X,'faces',F,'facecolor',0.9*[1 1 1]);
axis equal; axis off; axis tight;
title('(E1)');

subplot(2,4,2);
patch('vertices',V,'faces',F,'facecolor',0.9*[1 1 1]);
hold on;
patch('vertices',V,'faces',F_add,'facecolor',0.9*[0 1 0],'facealpha',0.6);
axis equal; axis off; axis tight;
title('(T) extend');

subplot(2,4,6);
patch('vertices',X,'faces',F,'facecolor',0.9*[1 1 1]);
hold on;
patch('vertices',X,'faces',F_add,'facecolor',0.9*[0 1 0],'facealpha',0.6);
axis equal; axis off; axis tight;
title('(E1) extend');

subplot(2,4,3);
patch('vertices',X_ext_uniform,'faces',F_ext,'facecolor',0.9*[1 1 1]);
axis equal; axis off; axis tight;
title('(E2)');

subplot(2,4,7);
patch('vertices',X_ext_construction,'faces',F_ext,'facecolor',0.9*[1 1 1]);
axis equal; axis off; axis tight;
title('(E3)');

subplot(2,4,4);
patch('vertices',X_ext_uniform,'faces',F,'facecolor',0.9*[1 1 1]);
axis equal; axis off; axis tight;
title('(E2) restricted');

subplot(2,4,8);
patch('vertices',X_ext_construction,'faces',F,'facecolor',0.9*[1 1 1]);
axis equal; axis off; axis tight;
title('(E3) restricted');
