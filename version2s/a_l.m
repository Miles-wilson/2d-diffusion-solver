function [a_l] = a_l(D, row, col, m, n, M, N)
%Capturing influnce of right point on center point
%   This function will take in inputs of the diffusion coefficient
%   matrix, all row and col points, the index of point in question,
%   and the length of the size of our A matrix (length). It will
%   return the appropriate value of a_R depending on what point is
%   being analyzed. 

if (n==1)               % left edge
    a_l = 0;
else      
    Dij = D(n,m);
    d = col(n)-col(n-1);
    if m == 1
        e = abs(row(m)-row(m+1));   
        a_l = -(Dij*e)/(2*d);
    elseif m==M                %% anywhere else is normal 
        Dijp1 = D(m-1,n);
        ejp1 = abs(row(m-1)-row(m));
        a_l = -(Dijp1*ejp1)/(2*d);
    else
        Dijp1 = D(m-1,n);
        ejp1 = abs(row(m-1)-row(m));
        e = abs(row(m)-row(m+1));
        a_l = -(Dij*e+Dijp1*ejp1)/(2*d);
end
end
