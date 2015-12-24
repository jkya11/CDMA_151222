function [xored_rat_sig] = custom_xor(rat_sig, code)
    xored_rat_sig = ones(1, 2*length(rat_sig));
    for i=1:length(rat_sig)
        if rat_sig(i) == code(1)
            xored_rat_sig(2*i-1) = 0;
        end
        if rat_sig(i) == code(2)
            xored_rat_sig(2*i) = 0;
        end
    end
end