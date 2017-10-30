function file_char = import_files_char(file,allowed_extensions)
%IMPORT_FILES_CHAR import file as characher array
%   
%   file_char = import_files_char(file,allowed_extensions)
% 
%   INPUT: file - location and name of file to be loaded.
%          allowed_extensions - string array of allowed file extensions
%          (e.g. [".txt",".dat"]).
%
%   OUTPUT: character array of file contents.

%   26/10/2017 - 01/11/2017 - Andrew Goldsborough

%check file's existence
if ~isfile(file)
    error('import_files_string:no_file','%s - not a file',file);
end
    
%check file extension
[~,~,file_ext] = fileparts(file);
if ~isstring(allowed_extensions)
    error('import_files_string:extstring','allowed_extensions must be a string array');
elseif ~ismember(file_ext,allowed_extensions)
    error('import_files_string:extension','%s - unsupported extension',file_ext);
end

%import text as character array
infile = fopen(file,'r');
file_char = fscanf(infile,'%c');
fclose(infile);

end





