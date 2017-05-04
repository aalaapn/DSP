function out = BPM_convert(ACF, fs)
	s = size(ACF);
    out = 1:size(1);
	for i = 1:s(1)
		out(i,1) = (fs*60)/(i);
	end
end