function out = ACF_calc(sig, num_banks, fs)
	if nargin < 2
		num_banks = 10;
	end

	if nargin < 3
		fs = 44100;
	end
	out = [];
	for i = 1:num_banks
		[ACFi, ~, ~] = autocorr(sig(:,i), fs, [], 2);
		if i == 1
			out = ACFi;
		else
			out = [out ACFi];
		end
	end

end