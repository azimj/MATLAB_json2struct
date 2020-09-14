function json_struct=json2struct(file_name)
% S=JSON2STRUCT(FILE_NAME)
%   Reads a JSON encoded file and returns a struct representing the JSON
%   objects.
%
% See also:
%   jsondecode

% Azim Jinha 
% 2020-09-13


% Parse input and check that file exists
p=inputParser;
p.addRequired('file_name',@isfile);
p.parse(file_name);

fid=fopen(file_name);
cln=onCleanup(@()fclose(fid));

file_contents = fread(fid,[1 inf],'uint8=>char');
json_struct = jsondecode(file_contents);

