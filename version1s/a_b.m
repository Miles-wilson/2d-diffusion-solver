function [a_b] = a_b(D, row, col, m, n, length)
%Capturing influnce of right point on center point
%   This function will take in inputs of the diffusion coefficient
%   matrix, all row and col points, the index of point in question,
%   and the length of the size of our A matrix (length). It will
%   return the appropriate value of a_R depending on what point is
%   being analyzed. 
Dij = D(n,m);           % d-coef at center
Dip1 = D(n+1,m);        % d-coef to the right
d = col(n)-col(n-1);    % delta spacing at centered point
e = row(m)-row(m-1);    % epsilon spacing at center
dp1 = col(n+1)-col(n);  % delta spacing between right and center pt
if (m==length)              % bottom edge
    a_b = 0;
elseif (m==1) && (n==length)         %% top right corner
    a_b = -(Dij*d)/(2*e);
else                            %% anywhere else is normal 
    a_b = -(Dij*d+Dip1*dp1)/(2*e);
end
end

