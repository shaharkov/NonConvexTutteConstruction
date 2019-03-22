figure;
patch('vertices',V,'faces',F,'facecolor',0.9*[1 1 1]);
hold on;
drawVertexNumbers(V,drawLabels);
axis equal; axis off;
title('(V,F) - input');
