function [a_t] = a_t(D, row, col, m, n, length)
%Capturing influnce of right point on center point
%   This function will take in inputs of the diffusion coefficient
%   matrix, all row and col points, the index of point in question,
%   and the length of the size of our A matrix (length). It will
%   return the appropriate value of a_R depending on what point is
%   being analyzed. 
Djp1 = D(n,m+1);        % d-coef to the right
Dip1jp1 = D(n+1,m+1);     % d-coef to the right and up
d = col(n)-col(n-1);    % delta spacing at centered point
ep1 = row(m+1)-row(m);  % epsilon spacing above centered point
dp1 = col(n+1)-col(n);  % delta spacing between right and center pt
if (m==1)               % top edge
    a_t = 0;
elseif (m==length) && (n==length)         % bottom right corner
    a_t = -(Djp1*d)/(2*ep1);
else                            % anywhere else is normal 
    a_t = -(Djp1*d+Dip1jp1*dp1)/(2*ep1);
end
end

