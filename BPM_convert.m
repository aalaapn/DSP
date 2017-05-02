function out = BPM_convert(ACF, fs)
	s = size(ACF);
	for i = 1:s(1)
		out(i,1) = (fs*60)/(i);
	end
end