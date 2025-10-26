function [meanResults, stdResults]= MvngWindOpert(data, WindowSize)
%inputs: 
% -data: input data
% -WindowSize: the size of the moving window [rows,cols]
%outputs:
%-meanResults: can be named any desired
%-stdResults: can be named any desired
meanResults = zeros(size(data) - WindowSize +1);
stdResults = zeros(size(data) - WindowSize +1);  

for j = 1:size(meanResults, 2)
    for i = 1:size(meanResults,1)
        WindowData = data(i:i+WindowSize(1)-1, j:j+WindowSize(2)-1);
        meanResults(i,j) = mean(WindowData(:));
        stdResults(i,j) = std(WindowData(:));
    end
end
end