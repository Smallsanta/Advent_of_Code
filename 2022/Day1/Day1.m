% https://adventofcode.com/2022/day/1

% Data was saved to an CSV and then imported as a 2249x1 array of strings

j = 0;
Cal = 0;

for i = 1:length(Day1Input)  
    if Day1Input(i) ~= ""
        Cal = Cal + str2double(Day1Input(i));
    else
        j = j+1;
        Output(j) = Cal;
        Cal = 0;
    end
end

max(Output)