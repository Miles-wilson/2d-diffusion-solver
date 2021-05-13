function [a_c] = a_c(SIGMA, a_r, a_l, a_t, a_b, n, m)
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here
a_c = SIGMA(m,n) - (a_r+a_l+a_t+a_b);
end

