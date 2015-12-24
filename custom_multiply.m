function [multiplied_rat_sig] = custom_multiply(rat_sig, code)
    multiplied_rat_sig = zeros(1, 2*length(rat_sig));
    for i=1:length(rat_sig)
        multiplied_rat_sig(2*i-1) = code(1)*rat_sig(i);
        multiplied_rat_sig(2*i) = code(2)*rat_sig(i);
    end
end