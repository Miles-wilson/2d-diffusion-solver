function [a_l] = a_l(D, row, col, m, n, length)
%Capturing influnce of right point on center point
%   This function will take in inputs of the diffusion coefficient
%   matrix, all row and col points, the index of point in question,
%   and the length of the size of our A matrix (length). It will
%   return the appropriate value of a_R depending on what point is
%   being analyzed. 
Dij = D(n,m);           % d-coef to the right
Djp1 = D(n,m+1);        % d-coef to the right and up
e = row(m)-row(m-1);    % epsilon spacing at centered point
ep1 = row(m+1)-row(m);  % epsilon spacing above centered point
d = col(n)-col(n-1);    % delta spacing between right and center pt
if (n==1)               % left edge
    a_l = 0;
elseif (m==1) && (n==length)         %% top row, not left corner
    a_l = -(Dij*e)/(2*d);
else                            %% anywhere else is normal 
    a_l = -(Dij*e+Djp1*ep1)/(2*d);
end
end
