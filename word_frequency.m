function [words,word_frequency] = word_frequency(text)
%WORD_FREQUENCY find frequency of words
%
%   [common_words,word_frequency] = word_frequency(text)
%
%   INPUT: text as a string array.
%
%   OUTPUT: string array of words without duplicates, in descending order 
%           of most frequently appearing.
%           column vector of frequency of appearances of words.

%   26/10/2017 - 01/11/2017 - Andrew Goldsborough

%check input
if ~isstring(text)
    error('word_frequency:nostring','input is not a string array');
end

words = [];
word_frequency = [];

%find frequency of words
while ~isempty(text)
    words = cat(1,words,text(1));
    word_frequency = cat(1,word_frequency,sum(text==text(1)));
    text(text==text(1)) = [];
end

%sort to find most common
[word_frequency,freq_idx] = sort(word_frequency,'descend');
words = words(freq_idx);

end
