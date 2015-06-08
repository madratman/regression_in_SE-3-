function [Serial_Num,Season,Num,Basin,Sub_basin,Name,ISO_time,Nature,Latitude,Longitude,WindWMO,PresWMO,Center1,WindWMOPercentile,PresWMOPercentile,Track_type] = import_hurricane(filename, startRow, endRow)
%IMPORTFILE1 Import numeric data from a text file as column vectors.
%   [SERIAL_NUM,SEASON,NUM,BASIN,SUB_BASIN,NAME,ISO_TIME,NATURE,LATITUDE,LONGITUDE,WINDWMO,PRESWMO,CENTER1,WINDWMOPERCENTILE,PRESWMOPERCENTILE,TRACK_TYPE]
%   = IMPORTFILE1(FILENAME) Reads data from text file FILENAME for the
%   default selection.
%
%   [SERIAL_NUM,SEASON,NUM,BASIN,SUB_BASIN,NAME,ISO_TIME,NATURE,LATITUDE,LONGITUDE,WINDWMO,PRESWMO,CENTER1,WINDWMOPERCENTILE,PRESWMOPERCENTILE,TRACK_TYPE]
%   = IMPORTFILE1(FILENAME, STARTROW, ENDROW) Reads data from rows STARTROW
%   through ENDROW of text file FILENAME.
%
% Example:
%   [Serial_Num,Season,Num,Basin,Sub_basin,Name,ISO_time,Nature,Latitude,Longitude,WindWMO,PresWMO,Center1,WindWMOPercentile,PresWMOPercentile,Track_type]
%   = importfile1('Allstorms.ibtracs_wmo.v03r05.csv',4, 186057);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2014/02/11 12:33:17

%% Initialize variables.
delimiter = ',';
if nargin<=2
    startRow = 4;
    endRow = inf;
end

%% Format string for each line of text:
%   column1: text (%s)
%	column2: double (%f)
%   column3: double (%f)
%	column4: text (%s)
%   column5: text (%s)
%	column6: text (%s)
%   column7: text (%s)
%	column8: text (%s)
%   column9: double (%f)
%	column10: double (%f)
%   column11: double (%f)
%	column12: double (%f)
%   column13: text (%s)
%	column14: double (%f)
%   column15: double (%f)
%	column16: text (%s)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%f%f%s%s%s%s%s%f%f%f%f%s%f%f%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
Serial_Num = dataArray{:, 1};
Season = dataArray{:, 2};
Num = dataArray{:, 3};
Basin = dataArray{:, 4};
Sub_basin = dataArray{:, 5};
Name = dataArray{:, 6};
ISO_time = dataArray{:, 7};
Nature = dataArray{:, 8};
Latitude = dataArray{:, 9};
Longitude = dataArray{:, 10};
WindWMO = dataArray{:, 11};
PresWMO = dataArray{:, 12};
Center1 = dataArray{:, 13};
WindWMOPercentile = dataArray{:, 14};
PresWMOPercentile = dataArray{:, 15};
Track_type = dataArray{:, 16};

