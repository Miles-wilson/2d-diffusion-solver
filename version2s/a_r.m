function [a_r] = a_r(D, row, col, m, n, M, N)
%Capturing influnce of right point on center point
%   This function will take in inputs of the diffusion coefficient
%   matrix, all col and row points, the index of point in question,
%   and the length of the size of our A matrix (length). It will
%   return the appropriate value of a_R depending on what point is
%   being analyzed. 
if n==N              %% right edge (n==length or n==N)???????
    a_r = 0;
else
    Dip1 = D(m,n+1);        % d-coef to the right
    dip1 = col(n+1)-col(n);
    if m==1
        e = abs(row(m)-row(m+1));
        a_r = -(Dip1*e)/(2*dip1);
    elseif m==M
        Dip1jp1 = D(m-1,n+1);
        ejp1 = abs(row(m-1)-row(m));
        a_r = -(Dip1jp1*ejp1)/(2*dip1);
    else                            %% anywhere else is normal
        Dip1jp1 = D(m-1,n+1);
        ejp1 = abs(row(m-1)-row(m));
        e = abs(row(m)-row(m+1));
        a_r = -(Dip1*e+Dip1jp1*ejp1)/(2*dip1);
    end
end
end

