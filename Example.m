%{
    Example of using the +json package to read from 
    and write to a JSON file.

    Azim J
    2020-10-16
%}
%% Write `struct` to a JSON file
s.Width=100;
s.Height=200;
s.Files.Name='test.json';
s.Array=[1:10];
json.struct2json(s,'test.json');

%% Read JSON file
s2 = json.json2struct('test.json');
