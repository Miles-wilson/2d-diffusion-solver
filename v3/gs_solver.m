function [phi_ans, er_ans] = gs_solver(Source, matrix_A, err)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%Step 1: Separate A into D, L, and U
col = size(matrix_A);
A = matrix_A;
D = diag(diag(A));
L = tril(A);
U = triu(A)-D;
P = -inv(L)*U;
spec_rad = max(eig(P));
s_size = size(Source);
S = zeros(s_size(1,1)*s_size(1,1),1);

for j=1:s_size(1)
    for i=1:s_size(1)
        S(((j-1)*s_size(1)+i),1) = Source(j,i);
    end
end

if abs(spec_rad)>=1
    error('Does not converge');
end

k=1;
x0 = ones(col(1,1),1);
phi(:,1) = x0;
real_err = err.*ones(col(1,end),1);
er = 1000.*ones(col(1,end),1);

while abs(er)>=abs(real_err)
      phi(:,k+1) = L\(S-U*phi(:,k));
      er = phi(:,k+1)-phi(:,k);
      k=k+1;
end

phi_vec = phi(:, k);
matrix_size = sqrt(size(phi_vec(:,1)));
matrix_size = matrix_size(1,1);
phi_ans = zeros(matrix_size, matrix_size);
er_ans = zeros(matrix_size, matrix_size);

position = 1;
for m=1:matrix_size
    for n=1:matrix_size
        phi_ans(m,n) = phi_vec(position,1);
        er_ans(m,n) = er(position,1);
        position=position+1;
    end
end
end

