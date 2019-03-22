figure;
subplot(2,4,1);
patch('vertices',V,'faces',F,'facecolor',0.9*[1 1 1]);
axis equal; axis off; axis tight;
title('(1)(V,F)');

subplot(2,4,5);
patch('vertices',X,'faces',F,'facecolor',0.9*[1 1 1]);
axis equal; axis off; axis tight;
title('(2)(X,F)');

subplot(2,4,2);
patch('vertices',V,'faces',F,'facecolor',0.9*[1 1 1]);
hold on;
patch('vertices',V,'faces',F_add,'facecolor',0.9*[0 1 0],'facealpha',0.6);
axis equal; axis off; axis tight;
title('(3)(V,F'')');

subplot(2,4,6);
patch('vertices',X,'faces',F,'facecolor',0.9*[1 1 1]);
hold on;
patch('vertices',X,'faces',F_add,'facecolor',0.9*[0 1 0],'facealpha',0.6);
axis equal; axis off; axis tight;
title('(4)(X,F'')');

subplot(2,4,3);
patch('vertices',U,'faces',F_ext,'facecolor',0.9*[1 1 1]);
axis equal; axis off; axis tight;
title('(5)(U,F'')');

subplot(2,4,7);
patch('vertices',Z,'faces',F_ext,'facecolor',0.9*[1 1 1]);
axis equal; axis off; axis tight;
title('(6)(Z,F'')');

subplot(2,4,4);
patch('vertices',U,'faces',F,'facecolor',0.9*[1 1 1]);
axis equal; axis off; axis tight;
title('(7)(U,F)');

subplot(2,4,8);
patch('vertices',Z,'faces',F,'facecolor',0.9*[1 1 1]);
axis equal; axis off; axis tight;
title('(8)(Z,F)');
