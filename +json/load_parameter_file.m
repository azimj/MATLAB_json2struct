function params = load_parameter_file(varargin)
%PARAMS=LOAD_PARAMETER_FILE(PARAMETERFILE) Loads parameters and custom 
%parameters from parameter file PARAMETERFILE

%Azim Jinha
%2021-05-31

mf=mfilename('fullpath');
pn = fileparts(mf);
default_custom_params = '';
p=inputParser;
p.addRequired('parameterFile',@isfile)
p.addOptional('customFile',default_custom_params,@(f)isfile(f) || isempty(f))
p.parse(varargin{:});

all_parameters_file = p.Results.parameterFile;
all_parameters = json.json2struct(all_parameters_file);

custom_param_file = p.Results.customFile;
custom_params = json.json2struct(custom_param_file);
pn = fileparts(custom_param_file);

master_params = json.mergestruct(all_parameters,custom_params);

custom_params = struct.empty;


if isfield(master_params,'custom_parameters') && ...
    ~isempty(master_params.custom_parameters)
    
    custom_file = fullfile(pn,master_params.custom_parameters);
    if isfile(custom_file)
        custom_params = json.json2struct(custom_file);
    end
end

params = json.mergestruct(master_params,custom_params);

a=0
