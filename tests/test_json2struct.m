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
    data_struct.Width=800;
    data_struct.Height=600;
    data_struct.Title='selected';
    data_struct.IDs=[1 2 3 4;5 6 7 8];
    data_struct.row = (10:14)';
    data_struct.sub_struct = data_struct;
    
    testCase.TestData.testStruct = data_struct;
    testCase.TestData.jsonfile = '_test.json';
end

function teardownOnce(testCase)
    disp('----')
    disp('teardown')
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