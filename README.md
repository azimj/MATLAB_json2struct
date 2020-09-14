# MATLAB_json2struct

A MATLAB package to handle reading and writing JSON files.

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
