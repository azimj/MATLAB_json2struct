function struct2json(data_struct, json_file)
% STRUCT2JSON(DATA,JSON_FILE)
%   Saves data to a JSON file.
%
%  Warning: function uses `jsonencode` which does not guarantee array
%  shapes are preserved. A 1xn vector will be encoded as a nx1 and does
%  not guarantee preservationo  of data types.
%
% See also:
%   jsonencode

% Azim Jinha
% 2020-09-14

%% Parse inputs
p=inputParser;
p.addRequired('data_struct',@isstruct);
p.addRequired('json_file',@(c)isstring(c)||ischar(c));
p.parse(data_struct,json_file);
%% Convert data to JSON

if verLessThan('matlab','9')
    json_string=prettyprintjson(data_struct);
else
    json_string=jsonencode(data_struct,ConvertInfAndNaN=false,PrettyPrint=true);
end

%% Write data
% open and write data to a file
try
    fid=fopen(json_file,'wb');
    cln=onCleanup(@()fclose(fid));
    fwrite(fid,json_string);
catch
    error('json2struct:OpenForWriteFailed', ...
        "Could not open file: " + json_file + " for writing.");
end




end

function pretty_json=prettyprintjson(data_struct)
%PRETTY_JSON=PRETTYPRINTJSON(DATA_STRUCT) add line breaks to encoded JSON
%JSON string
json_string=jsonencode(data_struct,'ConvertInfAndNaN',false);
% add a line break after commas and braces
regex_string='(\[\{\}\]|)';
replacement_string='$1\n';
json_string=regexprep(json_string,regex_string,replacement_string);
json_string=regexprep(json_string,',"',',\n"');
% remove new-line between close braces and comma '}\n,' -> '},'
regex_string_2 = '}\n,';
replacement_string_2 = '},';
pretty_json=regexprep(json_string,regex_string_2,replacement_string_2);
end