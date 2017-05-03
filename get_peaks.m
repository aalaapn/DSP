function out = get_peaks(acfs, fs)
	s = size(acfs);
	out = [];
	s(2);
	for i = 1:s(2)
		[val, locs] = findpeaks(acfs(:,i));
        for j = 1: length(locs)
            locs(j) = (fs*60)/locs(j);
        end
		out = cat(1, out, locs);
	end
    less60 = [];
    bet_60to80 = [];
    bet_80to100 = [];
    bet_100to120 = [];
    bet_120to140 = [];
    bet_140to160 = [];
    bet_160to_180 = [];

    for i = 1:length(out)
        if(out(i)<60)
            less60 = [less60 out(i)]
        elseif(out(i)>=60 && out(i) < 80)
            bet_60to80 = [bet_60to80 out(i)];
        
        elseif(out(i)>=80 && out(i) < 100)
            bet_80to100 = [bet_80to100 out(i)];
       
        elseif(out(i)>=100 && out(i) < 120)
            bet_100to120 = [bet_100to120 out(i)];
        
        elseif(out(i)>=120 && out(i) < 140)
            bet_120to140 = [bet_120to140 out(i)];

        elseif(out(i)>=140 && out(i) < 160)
            bet_140to160 = [bet_140to160 out(i)];

        elseif(out(i)>=160 && out(i) < 180)
            bet_160to180 = [bet_160to180 out(i)];
        end
    end
    
    less60
    bet_60to80
    bet_80to100
    bet_100to120
    bet_120to140
    bet_140to160
    bet_160to_180
end
