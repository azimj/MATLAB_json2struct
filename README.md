# MATLAB_json2struct

A MATLAB package to handle reading and writing JSON files. The package consists of two functions (`json2struct` and `struct2json`) which wrap the steps of opening a JSON file for reading or writing and interpreting the JSON content using MATLAB's `jsonencode` and `jsondecode`.

## Motivation

MATLAB introduced `jsonencode` and `jsondecode` which convert data from a struct to JSON string and back. But don't read data from a file. This package combines these two functions with `fread` to read and save JSON files.

## Examples

### Read data from a file

```MATLAB
data_struct=json.json2struct('test.json');
```

### Write data to a file

```MATLAB
data_struct.Width=800;
data_struct.Height=600;
data_struct.Title='selected';
data_struct.IDs=[1 2 3 4];
json.struct2json(data_struct,'test.json');
```
