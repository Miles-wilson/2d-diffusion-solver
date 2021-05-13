function [a_t] = a_t(D, row, col, m, n, M, N)
%Capturing influnce of right point on center point
%   This function will take in inputs of the diffusion coefficient
%   matrix, all row and col points, the index of point in question,
%   and the length of the size of our A matrix (length). It will
%   return the appropriate value of a_R depending on what point is
%   being analyzed. 
if m==1
    a_t = 0;
else
    Dijp1 = D(m-1,n);
    ejp1 = abs(row(m-1)-row(m));
    if n==1
        dip1 = abs(col(n+1)-col(n));
        Dip1jp1 = D(m-1,n+1);
        a_t = -(Dip1jp1*dip1)/(2*ejp1);
    elseif n==N
        d = abs(col(n)-col(n-1));    % delta spacing at centered point
        a_t = -(Dijp1*d)/(2*ejp1);
    else
        d = abs(col(n)-col(n-1));    % delta spacing at centered point
        dip1 = abs(col(n+1)-col(n));
        Dip1jp1 = D(m-1,n+1);
        a_t = -(Dijp1*d+Dip1jp1*dip1)/(2*ejp1);
    end
end
end

