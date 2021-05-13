function [phi_ans] = dif_solver(Source,D,abs_matrix,er)
%UNTITLED2 Summary of this function goes here
%   Master file: takes in 3 matricies (Absoprtion, diffusion, source) and
%   the maximum error for the GS-solver

%   check that absorption, source, diffusion matrices are square and positive
neg_s = sum(find(Source<0));
neg_abs = sum(find(abs_matrix<0));
neg_d = sum(find(D<0));
if neg_s>=1
    error('The Source matrix cannot contain negative values')
end
if neg_d>=1
    error('The diffusion matrix cannot contain negative values')
end
if neg_abs>=1
    error('The absorption matrix cannot contain negative values')
end

%   build all matrices into correct form: coefficients, source, absorption

matrix_A = array_builder(D, abs_matrix);
[phi_ans, err] = gs_solver(Source, matrix_A, er);
sz=size(Source(1,:));
x = [1:sz(2)];
y = [1:sz(2)];

[X,Y] = meshgrid(x,y);
surf(X,Y,phi_ans);
xlabel('x');
ylabel('y');
zlabel('Flux');
title('Neutron flux through material')

end

