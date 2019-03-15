function [indReflex,indConvex] = classifyReflexConvex(P, conn)

N = length(conn);
conn_cyclic = [conn(end); conn(:); conn(1)]; 

theta = zeros(N,1);
for ii = 1:N+1
    theta(ii) = atan2(P(conn_cyclic(ii+1),2)-P(conn_cyclic(ii),2),...
        P(conn_cyclic(ii+1),1)-P(conn_cyclic(ii),1));
end

dtheta = mod(-diff(theta),2*pi);

indReflex = false(size(P,1),1);
indConvex = false(size(P,1),1);
indReflex(conn) = dtheta>=pi;
indConvex(conn) = dtheta<=pi;
