function [phi_ans] = gs_solver(S, matrix_A, col, err)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%Step 1: Separate A into D, L, and U
A = matrix_A;
D = diag(A);
L = tril(A)-D;
U = triu(A)-D;
P = -(D+L)\U;
spec_rad = max(eig(P));

if abs(spec_rad)>=1
    disp('Does not converge');
    return
end

k=1;
x0 = ones(cols,1);
phi(:,1) = x0;
err = err*ones(col,1);
error = 1000.*ones(col,1);
while sum(abs(error)>=err) ~= 0
    phi(:,k+1) = P*phi(:,k)+(D+L)\S;
    error = phi(:,k+1)-phi(:,k);
    k=k+1;
end
phi_ans = phi(:, k);
end

