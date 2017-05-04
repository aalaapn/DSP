clear;
[filename,filepath] = uigetfile('*');
[histo,~,~] = noteHisto(strcat(filepath,filename));

% plots note histo
notes = categorical({'A', 'A# / Bb', 'B', 'C', 'C# / Db', 'D',...
    'D# / Eb', 'E', 'F', 'F# / Gb', 'G', 'G# / Ab'});
bar(notes,histo)

% set up "ideal" profiles, indexed by key (note) num
profiles = zeros(12);
profiles(:,1) = transpose([3 0 1 0 1 2 0 2 0 2 0 1]);

for i1 = 1:11
    profiles(:,i1+1) = wshift('1D',profiles(:,1),-i1);
end

% sort the histo values for analysis
[~, histoIndices] = sort(histo,'descend');

key = keyGuess(histoIndices, profiles)
keyString = char(notes(key))