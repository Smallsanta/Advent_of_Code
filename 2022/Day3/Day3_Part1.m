% pasted data into googlse sheets (col 1), found length/2 of each string
% (col 2), then split the string using Left(str,len/2) and Right(str,len/2)
% (col 3 and col 4)


%plan is to use str == str to compare the left and right halfs for common
%point

clear all
load Day3Input

Index = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';

for i = 1:length(Day3Input)
    Str1 = char(Day3Input(i,3));
    Str2 = char(Day3Input(i,4));
    CommonCharIndex = find( sum( Str1 == Str2' ,1) ,1);
    CommonChar(i) = strfind(Index,Str1(CommonCharIndex));
end

Output = sum(CommonChar)

% two ideas for converstion of char to number
% % double() conversts character to a number
% double(lowercase)-26 %starts at 1 with offset
% double(uppercase)-38 %starts at 27 with offset
% no my idea but I thought this was really clever, use strfind() to create
% index. Example Index = 'abcd' strfind(Index,'d') returns 4. This is
% possibly slower than double()