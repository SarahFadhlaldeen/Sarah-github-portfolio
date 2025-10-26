
function [DataOriginal,DataLagged]= lag_scatterplots(Data,lagRows, lagCols)

[rows, cols] = size(Data);

DataOriginal = [];    
DataLagged = [];

for i = 1+lagRows: rows
    for j = 1+lagCols: cols
        DataOriginal(end+1) = Data(i,j);
        DataLagged(end+1) = Data(i-lagRows, j-lagCols);
    end
end

end 