function text = remove_punctuation_English(text)
%REMOVE_PUNCTUATION_ENGLISH removes punctuation, english character set
%
%   text = remove_punctuation_English(text)
%
%   INPUT: character array of text to have punctuation removed.
%
%   OUTPUT: character array without punctuation.
%
%   RULES: leave spaces (' '),
%          replace other whitespace (e.g. carriage return) with space,
%          replace hyphenation and dash with space, 
%          remove all characters not in the English alphabet (a-z,A-Z)
%          convert all to lower case.
%
%   NOTES: only English, not compatible with other character sets or 
%          accents.
%          Contractions (e.g. "you're") will be reduced to just the letters
%          (e.g. "youre").
%          Hyphenated words will be split (e.g. "English-language" becomes 
%          "english language").

%   26/10/2017 - 01/11/2017 - Andrew Goldsborough

if ~ischar(text)
    error('remove_punctuation_English:notchar','input text is not a character array');
end

%characters to change to space
char_hyph = '[-—−_‐]';
char_whsp = '\s+';

%characters to keep
char_lower = '[a-z]';
char_upper = '[A-Z]';
char_space = ' ';

%replace hypenation with space
text = regexprep(text,char_hyph,char_space);

%remove any punctuation
idx_lower = regexp(text,char_lower);
idx_upper = regexp(text,char_upper);
idx_space = regexp(text,char_space);
idx_punct = 1:length(text);
idx_punct([idx_lower,idx_upper,idx_space]) = [];
text(idx_punct) = [];

%remove unnecessary whitespace
text = regexprep(text,char_whsp,char_space);

%convert to lower case
text = lower(text);

%remove final space if it exists, otherwise the final word in a string
%array will be "" as space is the standard delimiter
if text(end) == ' '
    text(end) = [];
end

end




