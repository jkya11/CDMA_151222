[rat1_sig, rat2_sig] = signal_generate_rat1_rat2();
[rat1_sig, rat2_sig] = trans_dec_to_bin(rat1_sig, rat2_sig);
% [rat1_sig, rat2_sig] = trans_01_to_minus11(rat1_sig, rat2_sig);

code1 = [1, 0];
code2 = [0, 1];

multiplied_rat1_sig = encode_multiply(rat1_sig, code1);
multiplied_rat2_sig = encode_multiply(rat2_sig, code2);

signal = multiplied_rat1_sig + multiplied_rat2_sig;
out_signal = zeros(length(signal));

% signal noising
sigma = 0.1;
filtered_signal = imnoise(signal, 'gaussian', 0, 0.01);

% signal reassembly
for i=1:length(signal)
    % get threshold
    if filtered_signal(i) > 0.5
        out_signal(i) = 1;
    else
        out_signal(i) = 0;
    end
end

figure(1);
plot(signal);

figure(2);
plot(filtered_signal);

figure(3);
plot(out_signal);

decoded_rat1_sig = decode_multiply(out_signal, code1);
decoded_rat2_sig = decode_multiply(out_signal, code2);

rat1_accurate_cnt = 0;
rat2_accurate_cnt = 0;
signal_accurate_cnt = 0;

for i=1:length(rat1_sig)
    if rat1_sig(i) == decoded_rat1_sig(i)
        rat1_accurate_cnt = rat1_accurate_cnt + 1;
    end
    if rat2_sig(i) == decoded_rat2_sig(i)
        rat2_accurate_cnt = rat2_accurate_cnt + 1;
    end
end

for i=1:length(signal)
   if(out_signal(i) == signal(i)) 
        signal_accurate_cnt = signal_accurate_cnt + 1;
    end 
end

rat1_whole_accuracy = (rat1_accurate_cnt / length(rat1_sig)) * 100;
rat2_whole_accuracy = (rat2_accurate_cnt / length(rat2_sig)) * 100;
signal_whole_accuracy = (signal_accurate_cnt / length(signal)) * 100;

rat1_whole_accuracy
rat2_whole_accuracy
signal_whole_accuracy

% [origin_rat1_sig, origin_rat2_sig] = trans_dtoa(decoded_rat1_sig, decoded_rat2_sig);


