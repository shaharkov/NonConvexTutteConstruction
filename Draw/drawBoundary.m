figure;
patch('vertices',P,'faces',find(bndInd)','edgecolor','r','facecolor','none');
hold on;
drawVertexNumbers(P,drawLabels);
axis equal; axis off;
title('given mapping of boundary onto P');
