function [rat1_sig_bin, rat2_sig_bin] = trans_01_to_minus11(rat1_sig_bin, rat2_sig_bin)
    rat1_sig_bin = 2*rat1_sig_bin - ones(1, length(rat1_sig_bin));
    rat2_sig_bin = 2*rat2_sig_bin - ones(1, length(rat2_sig_bin));
end