function [words_total,freq_total] = word_frequency_add(words_1,freq_1,words_2,freq_2)
%WORD_FREQUENCY_ADD combine arrays of words and their frequencies
%
%   [words_total,freq_total] = word_frequency_add(words_1,freq_1,words_2,freq_2)
%
%   INPUT: string array of unique words.
%          column vector of word frequencies.
%          second pair of words and frequencies to be combined.
%
%   OUTPUT: combination of the two sets of words and frequencies. Adds 
%           frequencies of words common to both word arrays and concatinates 
%           words and frequencies of the remaining words. The Final order
%           is 1 first then 2.

%   26/10/2017 - 01/11/2017 - Andrew Goldsborough

%check input 1
if ~isempty(words_1) && ~isempty(freq_1)
    if ~isstring(words_1)
        error('word_frequency_add:words_1type','words_1 must be a string array');
    elseif ~isequal(length(words_1),length(unique(words_1)))
        error('word_frequency_add:words_1unique','elements of words_1 must be unique');
    elseif ~iscolumn(freq_1)
        error('word_frequency_add:freq_1type','freq_1 must be a column vector');
    end
end

if ~isequal(size(words_1),size(freq_1))
    error('word_frequency_add:length1','words_1 and freq_1 must be same size');
end

%check input 2
if ~isempty(words_2) && ~isempty(freq_2)    
    if ~isstring(words_2) 
        error('word_frequency_add:words_2type','words_2 must be a string array');
    elseif ~isequal(length(words_2),length(unique(words_2)))
        error('word_frequency_add:words_2unique','elements of words_2 must be unique');
    elseif ~iscolumn(freq_2)
        error('word_frequency_add:freq_2type','freq_2 must be a column vector');
    end
end

if ~isequal(size(words_2),size(freq_2))
    error('word_frequency_add:length2','words_2 and freq_2 must be same size');
end

%combine word and frequency arrays
if ~isempty(words_1) && ~isempty(words_2)
    %find whether the words_2 are already in words_1, and the index if they
    %are. Uses the index to combine frequencies of words and totals.
    [in_tot,w_idx] = ismember(words_2,words_1);
    freq_1(w_idx(w_idx ~= 0)) = freq_1(w_idx(w_idx ~= 0)) + freq_2(in_tot);
    
    %add new words to totals
    words_2(in_tot) = [];
    words_total = cat(1,words_1,words_2);
    freq_2(in_tot) = [];
    freq_total = cat(1,freq_1,freq_2);
else
    words_total = cat(1,words_1,words_2);
    freq_total = cat(1,freq_1,freq_2);
end

end


