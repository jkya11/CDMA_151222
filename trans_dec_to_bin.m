function [rat1_sig_bin, rat2_sig_bin] = trans_dec_to_bin(rat1_sig, rat2_sig)
    rat1_sig_bin = zeros(1, length(rat1_sig)*8);
    rat2_sig_bin = zeros(1, length(rat2_sig)*8);
    
    for i=1:length(rat1_sig)
        for j=1:8
          rat1_sig_bin(i*8-j+1) = mod(rat1_sig(i), 2);
          rat1_sig(i) = floor(rat1_sig(i)/2);
        end
    end

    for i=1:length(rat2_sig)
        for j=1:8
          rat2_sig_bin(i*8-j+1) = mod(rat2_sig(i), 2);
          rat2_sig(i) = floor(rat2_sig(i)/2);
        end
    end
end