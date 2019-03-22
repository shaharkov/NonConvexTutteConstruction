function drawEdgeWeights(X,W,do)

if do
    [I,J] = find(tril(W));
    X_edge = (X(I,:)+X(J,:))/2;
    W_IJ = W(sub2ind(size(W),I,J));
    W_JI = W(sub2ind(size(W),J,I));
    for ii = 1:length(W_IJ)
        text(X_edge(ii,1),X_edge(ii,2),sprintf('%.2f\n%.2f',W_IJ(ii),W_JI(ii)),'color','m','HorizontalAlignment','center');
    end
end
