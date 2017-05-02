function out = multi_plot(sig, x, beg, lags)
	if nargin < 3
		beg = 40
	end

	if nargin < 4
		lags = 442
	end


	s = size(sig);
	numplots = s(2)
	x = x(beg: lags);

	for i=1:(numplots)
		subplot(numplots/2, numplots/2-1, i);
		subsig = sig(:,i);
		subsig = sig(beg:lags);
		plot(x, subsig);
		title(['filter bank' num2str(i)])
	end

end
