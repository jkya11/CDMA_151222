function [multiplied_rat_sig] = decode_multiply(rat_sig, code)
    tmp_sig = zeros(1, length(rat_sig));
    multiplied_rat_sig = zeros(1, length(rat_sig)/2);
    for i=1:length(rat_sig)
        if mod(i,2) == 1
            tmp_sig(i) = rat_sig(i)*code(1);
        else 
            tmp_sig(i) = rat_sig(i)*code(2);
        end
    end
    
    if code(1) == 1 && code(2) == 0
        for i=1:length(rat_sig)/2
            if tmp_sig(i*2-1) == 1
                multiplied_rat_sig(i) = 1;
            end
        end
    end
    
    if code(1) == 0 && code(2) == 1
        for i=1:length(rat_sig)/2
            if tmp_sig(i*2) == 1
                multiplied_rat_sig(i) = 1;
            end
        end
    end
   
end