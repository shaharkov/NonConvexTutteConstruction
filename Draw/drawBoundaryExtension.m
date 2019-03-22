figure;
patch('vertices',P,'faces',find(bndInd)','edgecolor','r','facecolor','none');
hold on;
patch('vertices',P,'faces',F_add,'facecolor',0.9*[0 1 0],'facealpha',0.6);
axis equal; axis off;
title('Adding triangles to the polygon to extend to the convex hull');
