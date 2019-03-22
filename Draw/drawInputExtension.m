figure;
patch('vertices',V,'faces',F_ext,'facecolor',0.9*[1 1 1]);
hold on;
patch('vertices',V,'faces',F_add,'facecolor',0.9*[0 1 0],'facealpha',0.6);
drawVertexNumbers(V,drawLabels);
axis equal; axis off;
title('(V,F'') -- problem: adding triangles to the input results in intersections')
