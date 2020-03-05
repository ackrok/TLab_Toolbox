function datMemMap = getDatMemMap(datFF,nChan)
%datMemMap - Create a memory map to dat files
%
%   Usage:
%       datMemMap = getDatMemMap(datFF,nChan);
%
%   Description: This function uses the full path to the dat file including
%   the number of channels and creates a memory map to it. This allows
%   users to access the dat file without having to read chunks using fread.
%   
%   Input:
%       datFF - Full path to the dat file
%       nChan - Number of channels in the dat file
%
%   Output:
%       datMemMap - Memory map data structure
%
%   Author: Pratik Mistry, 2020
%

datStruct = dir(datFF);
nBytes = numel(typecast(cast(0,'int16'),'uint8'));
nSamp = datStruct.bytes/(nChan*nBytes);
datMemMap = memmapfile(datFF,'Format',{'int16',[nChan nSamp],'dat'});
end