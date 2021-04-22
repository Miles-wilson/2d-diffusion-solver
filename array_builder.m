function [matrix_A] = array_builder(D, S, SIGMA, width, height, mesh_space_x, mesh_space_y)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
N = floor(width/mesh_space_x);     % total number of mesh points in x
M = floor(height/mesh_space_y);    % total number of mesh points in y

row = [1:1:M];              % represents row indices in volume
col = [1:1:N];              % represents column indices in volume

length = M*N;               % size of matrix_A

matrix_A = zeros(length,length);    % initialize these three matrices
matrix_b = zeros(length,1);

% make matrix for D values for regions, sigmas for regions and S's for regions
coefs = zeros(length, 5);

for m=1:1:M                     %DO YOU NEED TO REFLECT D, S, SIGMA SO BOTTOM IS AT TOP AND VICE VERSA?
    for n=1:1:N
        coefs(m) = [a_r(D, row, col, m, n, length), a_l(D, row, col, m, n, length), a_b(D, row, col, m, n, length),
            a_t(D, row, col, m, n, length), a_c(SIGMA, a_r, a_l, a_b, a_t, m, n)];
%         a_r = a_r(D, row, col, m, n, length);
%         a_l = a_r(D, row, col, m, n, length);
%         a_b = a_r(D, row, col, m, n, length);
%         a_t = a_r(D, row, col, m, n, length);
%         a_c = a_r(SIGMA, a_r, a_l, a_b, a_t, m, n);
    end
end

cs = coefs(:,5);
for x=1:length
    matrix_A(x, x) = cs(x);                     %insert all center vals down central diagonal
end

rs = coefs(:,1);
ls = coefs(:,2);
count=1;
for x=1:length-1                    % adding right coefs to respective diagonal positions assuming all matrices are perfect squares (requires editing of mesh sizing)
    if count<sqrt(length)
        matrix_A(x,x+1) = rs(1);
        matrix_A(x+1,x) = ls(1);
        rs(1,:)=[];
        ls(1,:)=[];
        count = count+1;
    else
        count=1;
        matrix_A(x,x+1) = 0;
        matrix_A(x+1,x) = 0;
    end
end

ts = coefs(:,4);
bs = coefs(:,3);
ts(ts==0) = [];     %top coefficients
bs(bs==0) = [];     %bottom coefficients

for x=1:length(bs)
    matrix_A(x, x+length-length(ts)) = ts(x);   %insert all top and bottom vals down their respective diagonal
    matrix_A(x+length-length(bs), x) = bs(x);
end

end


