function [] = solverinputs()
% Takes solver inputs and returns results from dif_solver
%   
XY_prompt = 'Enter overall dimension where X=Y: ';
X = input(XY_prompt);

num_prompt = 'Enter the number of materials: ';
num_mat = input(num_prompt);
% mat_inputs = zeros(num_mat,6);
abs_matrix = zeros(X,X);
d_matrix = zeros(X,X);
for m=1:num_mat
    x1_prompt = 'Enter x1 bounds for material (ex. top left corner x is 1): ';
    x1 = input(x1_prompt);
    y1_prompt = 'Enter y1 bounds for material (ex. top left corner y is 1): ';
    y1 = input(y1_prompt);
    x2_prompt = 'Enter x2 bounds for material (ex. bottom right corner x is 2): ';
    x2 = input(x2_prompt);
    y2_prompt = 'Enter y2 bounds for material (ex. bottom right corner y is 2): ';
    y2 = input(y2_prompt);
    abs_prompt = 'Enter a macroscopic absorption to be applied to material: ';
    abs_val = input(abs_prompt);
    d_prompt = 'Enter a diffusion coefficient to be applied to material: ';
    d_val = input(d_prompt);
%    mat_inputs(m,:) = [x,y,abs_val,d];
    abs_matrix(y1:y2,x1:x2) = ones((y2-y1+1),(x2-x1+1)).*abs_val;
    d_matrix(y1:y2,x1:x2) = ones((y2-y1+1),(x2-x1+1)).*d_val;
end

s_prompt = 'Enter the number of sources: ';
s_num = input(s_prompt);
s_matrix = zeros(X,X);
for m=1:s_num
    s_x1_prompt = 'Enter x1 bound for source: ';
    x1 = input(s_x1_prompt);
    s_y1_prompt = 'input y1 bound for source: ';
    y1 = input(s_y1_prompt);
    s_x2_prompt = 'input x2 bound for source: ';
    x2 = input(s_x2_prompt);
    s_y2_prompt = 'input y2 bound for source: ';
    y2 = input(s_y2_prompt);
    s_s_prompt = 'Enter a source to be applied to material(s): ';
    s = input(s_s_prompt);
%     s_inputs(m,:) = [x,y,s];
    s_matrix(y1:y2,x1:x2) = ones((y2-y1+1),(x2-x1+1)).*s;
end

error_prompt = 'Enter desired maximum error for GS iteration: ';
err = input(error_prompt);

dif_solver(s_matrix, d_matrix, abs_matrix, err);

end

