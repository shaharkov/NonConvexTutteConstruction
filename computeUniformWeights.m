function W = computeUniformWeights(F)

% get edges
E = [F(:,1),F(:,2); ...
    F(:,2),F(:,3);...
    F(:,3),F(:,1)];

% put uniform weights
W = double(accumarray(E,1) | accumarray(E,1)');

