function tests = test_json2struct
% TESTS = TEST_JSON2STRUCT
%   Test the creation and loading of json files
%

% Azim J
% 2021-02-17
    tests = functiontests(localfunctions);
end

function setupOnce(testCase)
% setup a test struct with some fields to be written to file as JSON
    addpath('..')
    data_struct.Width=800;
    data_struct.Height=600;
    data_struct.Title='selected';
    data_struct.IDs=[1 2 3 4;5 6 7 8];
    data_struct.row = (10:14)';
    final_data.parameters = data_struct;
    
    testCase.TestData.testStruct = final_data;
    testCase.TestData.jsonfile = '_test.json';
end

function teardownOnce(testCase)
    disp('----')
    disp('teardown')
    rmpath('..')
    %delete(testCase.TestData.jsonfile)
end
function test_create_json(testCase)

    json.struct2json(testCase.TestData.testStruct,testCase.TestData.jsonfile);
    testCase.assertTrue(isfile(testCase.TestData.jsonfile))
end

function test_read_json(testCase)
    dataStruct = json.json2struct(testCase.TestData.jsonfile);
    eq = isequal(dataStruct,testCase.TestData.testStruct);
    testCase.assertTrue(eq);
end

function test_load_customization(testCase)
    default_params=fullfile('..','default.json');
    custom_params = fullfile('..','test.json');
    actual=json.load_parameter_file(default_params,custom_params);
    expected=json.json2struct('expected.json');
    testCase.assertEqual(actual,expected)
end
