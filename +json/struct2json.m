function struct2json(data_struct, json_file)
% STRUCT2JSON(DATA,JSON_FILE)
%   Saves data to a JSON file. 
%
% See also: 
%   jsonencode

% Azim Jinha
% 2020-09-14

%% Parse inputs
p=inputParser;
p.addRequired('data_struct',@isstruct);
p.addRequired('json_file',@(c)isstring(c)||ischar(c));

%% Convert data to JSON
ss=jsonencode(data_struct,'ConvertInfAndNaN',false);

% add a line break after commas and braces
regex_string='([,{}])';
replacement_string='$1\n';
ss=regexprep(ss,regex_string,replacement_string);

%% Write data
% open and write data to a file
fid=fopen(json_file,'wb');
cln=onCleanup(@()fclose(fid));

fwrite(fid,ss);