function json_struct=json2struct(file_name,varargin)
% S=JSON.JSON2STRUCT(FILE_NAME,ELEMENT_NAME)
%   Reads a JSON encoded file and returns a struct representing the JSON
%   objects and returns the specified element `element_name`
%
% S=JSON.JSON2STRUCT(FILE_NAME) Return all contents of the JSON file
%
% WARNING: row vectors (1xn) vectors will be read as a column (nx1).
% 
%
% See also:
%   jsondecode

% Azim Jinha 
% 2020-09-13

% Change Log
% 2021-02-17
%   * Added optional parameter to extract a sub-structure


% Parse input and check that file exists
p=inputParser;
p.addRequired('file_name',@(f)exist(f,'file')==2);
p.addOptional('element_name','',@(s)isstring(s) || ischar(s));
p.parse(file_name,varargin{:});

fid=fopen(file_name);
cln=onCleanup(@()fclose(fid));

file_contents = fread(fid,[1 inf],'uint8=>char');
try
     json_struct = jsondecode(file_contents);
catch 
     error('json2struct:InvalidJSONdata',"File: '" + file_name +"' does not contain valid JSON");
end

if isfield(json_struct,p.Results.element_name)
     json_struct = json_struct.(p.Results.element_name);
end

