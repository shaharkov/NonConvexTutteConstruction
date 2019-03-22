figure;
patch('vertices',P,'faces',find(bndInd)','edgecolor','r','facecolor','none');
hold on;
quiver(X(:,1),X(:,2),G(:,1),G(:,2));
axis equal; axis off;
title(sprintf('visualizing the assumption: the cone condition holds\n(wrt the solution of Laplace eq with given weights)'));