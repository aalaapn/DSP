function out = get_peaks(acfs, fs)
	s = size(acfs);
	out_arr = [];
    w_arr = [];
    p_arr = [];
	s(2);
	for i = 1:s(2)
		[val, locs, w, p] = findpeaks(acfs(:,i));
        for j = 1: length(locs)
            locs(j) = (fs*60)/locs(j);
        end
        out_arr = cat(1, out_arr, locs);
        w_arr = cat(1, w_arr, w);
        p_arr = cat(1, p_arr, p);
    end

    %sort the peaks by width
    net1 = [out_arr w_arr p_arr];
    [Y, I] = sort(net1(:,2), 'descend');
    net2 = net1(I, :);

    %take top five peaks
    top_five = net2(1:5, 1);
	
    %sort the peaks into given bands
    less60 = [];
    bet_60to80 = [];
    bet_80to100 = [];
    bet_100to120 = [];
    bet_120to140 = [];
    bet_140to160 = [];
    bet_160to180 = [];

    for i = 1:length(top_five)
        if(top_five(i)<60)
            less60 = [less60 top_five(i)]
        elseif(top_five(i)>=60 && top_five(i) < 80)
            bet_60to80 = [bet_60to80 top_five(i)];
        
        elseif(top_five(i)>=80 && top_five(i) < 100)
            bet_80to100 = [bet_80to100 top_five(i)];
       
        elseif(top_five(i)>=100 && top_five(i) < 120)
            bet_100to120 = [bet_100to120 top_five(i)];
        
        elseif(top_five(i)>=120 && top_five(i) < 140)
            bet_120to140 = [bet_120to140 top_five(i)];

        elseif(top_five(i)>=140 && top_five(i) < 160)
            bet_140to160 = [bet_140to160 top_five(i)];

        elseif(top_five(i)>=160 && top_five(i) < 180)
            bet_160to180 = [bet_160to180 top_five(i)];
        end
    end
    
    s_less60 = length(less60);
    s_bet_60to80 = length(bet_60to80);
    s_bet_80to100 = length(bet_80to100);
    s_bet_100to120 = length(bet_100to120);
    s_bet_120to140 = length(bet_120to140);
    s_bet_140to160 = length(bet_140to160);
    s_bet_160to180 = length(bet_160to180);

    s_bank = [s_less60 s_bet_60to80 s_bet_80to100 s_bet_100to120 s_bet_120to140 s_bet_140to160 s_bet_160to180];

    %find which band has the largest number of peaks and output the averag of those peak's bpm
    [max_val, ind] = max(s_bank);
    
    switch ind
        case 1
            out = mean(less60);
        case 2
            out = mean(bet_60to80);
        case 3
            out = mean(bet_80to100);
        case 4
            out = mean(bet_100to120);
        case 5
            out = mean(bet_120to140);
        case 6
            out = mean(bet_140to160);
        case 7
            out = mean(bet_160to180);
    end

end
