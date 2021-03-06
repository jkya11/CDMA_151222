function [ yfilt ] = gaussian_filter( signal, sigma )
% generate rect signal

size = length(signal);
x = linspace(-size / 2, size / 2, size);
gaussFilter = exp(-x.^2 / (2 * sigma ^ 2));
gaussFilter = gaussFilter / sum(gaussFilter);

% yfilt = filter(gaussFilter, 1, sig);
yfilt = conv(signal, gaussFilter, 'same');


end

