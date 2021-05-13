function [matrix_A] = array_builder(D, SIGMA)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% N = floor(width/mesh_space_x);     % total number of mesh points in x
% M = floor(height/mesh_space_y);    % total number of mesh points in y

sz = size(SIGMA);
N = sz(2);
M = sz(1);

row = [1:1:M];              % represents row indices in volume
col = [1:1:N];              % represents column indices in volume

lngth = M*N;               % size of matrix_A

matrix_A = zeros(lngth,lngth);    % initialize these three matrices

% make matrix for D values for regions, sigmas for regions and S's for regions
coefs = zeros(lngth, 5);

for m=1:M   %DO YOU NEED TO REFLECT D, S, SIGMA SO BOTTOM IS AT TOP AND VICE VERSA?
    for n=1:N
        a_R = a_r(D, row, col, m, n, M, N);
        a_L = a_l(D, row, col, m, n, M, N);
        a_B = a_b(D, row, col, m, n, M, N);
        a_T = a_t(D, row, col, m, n, M, N);
        a_C = a_c(SIGMA, a_R, a_L, a_B, a_T, m, n);
        coefs((m-1)*M+n,:) = [a_R, a_L, a_B, a_T, a_C];
    end
end

cs = coefs(:,5);
for x=1:lngth
    matrix_A(x, x) = cs(x); %insert all center vals down central diagonal
end

rs = coefs(:,1);
ls = coefs(:,2);

for x=1:length(ls)-1                        % adding left coefs to respective diagonal positions assuming all matrices are perfect squares (requires editing of mesh sizing)
        matrix_A(x+1,x) = ls(x+1);
end

for x=1:length(rs)-1                        % adding right coefs to respective diagonal positions assuming all matrices are perfect squares (requires editing of mesh sizing)
        matrix_A(x,x+1) = rs(x);
end

ts = coefs(:,4);
bs = coefs(:,3);
ts(ts==0) = [];     %top coefficients
bs(bs==0) = [];     %bottom coefficients
bl = length(bs);
tl = length(ts);

for x=1:tl
    matrix_A(x, lngth-tl+1) = ts(x);   %insert all top vals down their respective diagonal
    tl=tl-1;
end

for x=1:length(bs)
    matrix_A(lngth-bl+1, x) = bs(x);  %insert all bottomvals down their respective diagonal
    bl=bl-1;
end

end


