function [a_b] = a_b(D, row, col, m, n, M, N)
%Capturing influnce of right point on center point
%   This function will take in inputs of the diffusion coefficient
%   matrix, all row and col points, the index of point in question,
%   and the length of the size of our A matrix (length). It will
%   return the appropriate value of a_R depending on what point is
%   being analyzed. 
if m==M
    a_b = 0;
else
    Dij = D(n,m);
    ej = row(m)-row(m+1);
    if n==1
        dip1 = col(n+1)-col(n);
        Dip1j = D(m,n+1);
        a_b = -(Dip1j*dip1)/(2*ej);
    elseif n==N
        d = col(n)-col(n-1);    % delta spacing at centered point
        a_b = -(Dij*d)/(2*ej);
    else
        d = col(n)-col(n-1);    % delta spacing at centered point
        dip1 = col(n+1)-col(n);
        Dip1j = D(m,n+1);
        a_b = -(Dij*d+Dip1j*dip1)/(2*ej);
    end
end
end

