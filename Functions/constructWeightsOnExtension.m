function W_ext_construction = constructWeightsOnExtension(bndInd, bndInd_ext, ...
    W, W_ext_uniform,...
    X, P, G)


% classify boundary vertices into convex/reflex
[bndIndReflex,bndIndConvex] = classifyReflexConvex(P, find(bndInd));

% constuct weights, case by case:
W_ext_construction = zeros(size(W));

% (1) boundary of the extended triangulation.
% take uniform weights - they don't matter as these vertices are fixed:
v_bnd = bndInd_ext;
W_ext_construction(v_bnd,:) = W_ext_uniform(v_bnd,:);

% (2) interior to the original triangulation.
% copy the original weights:
v_int = ~bndInd;
W_ext_construction(v_int,:) = W(v_int,:);

% (3) interior to extension but boundary of original:
v_intbnd = ~bndInd_ext & bndInd;

% (3a) convex wrt to P:
v_intbnd_convex = v_intbnd & bndIndConvex;
for ii = find(v_intbnd_convex)'
    if isempty(ii)
        break
    end
    % for vertex ii (was on boundary, now interior) find neighbors
    neighborsInd = logical(W_ext_uniform(ii,:));
    neighborsEdges = X(neighborsInd,:)-P(ii,:);
    % find a positive combination of neighborsEdges that vanishes 
    % (proof shows existence)
    [neighborsWeights,err,t] = getPositiveCombination(neighborsEdges,[0,0]);
    assert((err<1e-10)&(t>0), 'valid linear combination not found!');
    % set weights
    W_ext_construction(ii,neighborsInd) = neighborsWeights';
end

% (3b) convex wrt to P:
v_intbnd_reflex = v_intbnd & bndIndReflex;
for ii = find(v_intbnd_reflex)'
    % for vertex ii (was on boundary, now interior) find old boundary
    % neighbors and new neighbors (all are boundary thus have known coordinates):
    neighborsInd = (logical(W_ext_uniform(ii,:)) - logical(W(ii,:))) | (logical(W(ii,:)) & bndInd');
    neighborsEdges = P(neighborsInd,:)-P(ii,:);
    % find a positive combination of neighborsEdges that will cancel out G(ii,:)
    % (proof shows existence)
    [w,err,t] = getPositiveCombination([neighborsEdges; G(ii,:)],[0,0]);
    neighborsWeights = w(1:end-1)/w(end);
    assert((err<1e-10)&(t>0), 'valid linear combination not found!');
    % set weights
    W_ext_construction(ii,:) = W(ii,:);
    W_ext_construction(ii,neighborsInd) = W_ext_construction(ii,neighborsInd) + neighborsWeights';
end

