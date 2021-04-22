function [a_r] = a_r(D, row, col, m, n, length)
%Capturing influnce of right point on center point
%   This function will take in inputs of the diffusion coefficient
%   matrix, all row and col points, the index of point in question,
%   and the length of the size of our A matrix (length). It will
%   return the appropriate value of a_R depending on what point is
%   being analyzed. 
Dip1 = D(n+1,m);        % d-coef to the right
Dip1jp1 = D(n+1,m+1);   % d-coef to the right and up
e = row(m)-row(m-1);    % epsilon spacing at centered point
ep1 = row(m+1)-row(m);  % epsilon spacing above centered point
dp1 = col(n+1)-col(n);  % delta spacing between right and center pt
if (n==length)              %% right edge
    a_r = 0;
elseif (m==1) && (n==1)         %% top row, not right corner
    a_r = -(Dip1*e)/(2*dp1);
else                            %% anywhere else is normal 
    a_r = -(Dip1*e+Dip1jp1*ep1)/(2*dp1);
end
end

