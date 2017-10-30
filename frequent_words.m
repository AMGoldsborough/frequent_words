function frequent_words(top_n,input_folder,output_folder,allowed_extensions)
%FREQUENT_WORDS finds the most frequent words in text files
%
%   Program to find the most common words in text files within a given
%   folder, and the most common words in the folder overall.
%
%   INPUT: top 'n' most common words
%          name of input folder as string
%          name of output folder as string
%          allowed extensions as string array in format ".ext" 
%          (e.g. [".txt",".dat"])
%
%   OUTPUT: file in the output folder containing the top 'n' words in each
%           file as well as the top 'n' in the folder as a whole. The name
%           of the file is "frequent_files_[TIMESTAMP].out", where
%           [TIMESTAMP] is a timestamp from when the program was started.

%   26/10/2017 - 01/11/2017 - Andrew Goldsborough

%set defaults
if nargin == 0
    top_n = 10;
    input_folder = "./input_files/";
    output_folder = "./output_files/";
    allowed_extensions = [".txt",".TXT"];
    
    fprintf('default inputs:\n');
    fprintf('top_n = %d\n',top_n);
    fprintf('input_folder = %s\n',input_folder);
    fprintf('output_folder = %s\n',output_folder);
    fprintf('allowed_extensions = %s\n\n',strjoin(allowed_extensions,' '));
elseif nargin ~= 4
    error('frequent_words:inputno','requires 4 inputs');
end

%check top_n is a positive integer
if ~(rem(top_n,1) == 0 && top_n > 0)
    error('frequent_words:top_n','top_n should be a positive integer');
end

%check input and output folder names
if ~isfolder(input_folder)
    error('frequent_words:input_folder','input_folder not found');
end
if ~isfolder(output_folder)
    error('frequent_words:input_folder','input_folder not found');
end

%check allowed extensions
if ~isstring(allowed_extensions)
    error('frequent_words:allowed_extensions','allowed_extensions should be a string array');
end
    
%query folder
folder_contents = dir(char(input_folder));

%print file info
timestamp = strjoin(string(fix(clock)),'');
outfile = fopen(strcat(output_folder,'frequent_words_',timestamp,'.out'),'w');
fprintf(outfile,'Input folder: %s\n\n', string(folder_contents(1).folder));
fprintf(outfile,'Most common words and frequencies in:\n');

%set storage
words_total = [];
freq_total = [];

%loop over folder contents
for file_no = 1:size(folder_contents,1)
    try
        %read files
        file_contents = import_files_char(strcat(input_folder,folder_contents(file_no).name),allowed_extensions);
        fprintf('opened "%s"\n',folder_contents(file_no).name);
    
        %remove punctuation
        file_contents = remove_punctuation_English(file_contents);
        
        %save as a string array of separate words, removing any blanks
        file_contents = split(string(file_contents));
        
        %find frequency of words
        [words,freq] = word_frequency(file_contents);
        
        %output top n for each file
        fprintf(outfile,'\n%s:\n\n', string(folder_contents(file_no).name));
        for i = 1:min(top_n,length(words))
            fprintf(outfile,'%d) %s - %d\n',i,words(i),freq(i));
        end
        
        %add words to folder total
        [words_total,freq_total] = word_frequency_add(words_total,freq_total,words,freq);
        
    catch ME
        switch ME.identifier
            case 'import_files_string:extension'
                fprintf('skipped "%s" - unsupported extension\n',folder_contents(file_no).name);
            case 'import_files_string:no_file'
                fprintf('skipped "%s" - not a file\n',folder_contents(file_no).name);
            otherwise
                fprintf('skipped "%s" - failed\n',folder_contents(file_no).name);
        end
    end
end

%sort totals
[freq_total,freq_idx] = sort(freq_total,'descend');
words_total = words_total(freq_idx);

%print details
fprintf(outfile,'\nover all files in %s:\n\n',string(folder_contents(1).folder));
for i = 1:min(top_n,length(words_total))
    fprintf(outfile,'%d) %s - %d\n',i,words_total(i),freq_total(i));
end
fclose(outfile);

end
