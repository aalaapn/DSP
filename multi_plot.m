function out = multi_plot(sig, x, beg, lags)
	% function to plot multiple graphs
	%
	%
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
		subplot(3, 4, i);
		subsig = sig(:,i);
		subsig = subsig(beg:lags);
		plot(x, subsig);
		title(['filter bank' num2str(i)])
	end

end
