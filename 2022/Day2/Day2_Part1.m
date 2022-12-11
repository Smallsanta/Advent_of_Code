% https://adventofcode.com/2022/day/2

% Data was parced in Google Sheets, saved as CSV, imported as a string
% array and and saved as a .mat file for later use.
load Day2Input.mat

% loop though each game and tally score
% 1 for Rock, 2 for Paper, and 3 for Scissors
% 3 for win, 0 for loss

% R P S - X Y Z - A B C - 1 2 3
% converting XYZ and ABC to 123
Input = strrep(Day2Input,'X','1');
Input = strrep(Input,'Y','2');
Input = strrep(Input,'Z','3');
Input = strrep(Input,'A','1');
Input = strrep(Input,'B','2');
Input = strrep(Input,'C','3');

Key = str2double(Input);
Points = 0;

%%
% My Hand - Their Hand
% 1-1 = 0   -> tie
% 1-2 = -1 -> loss
% 1-3 = -2   -> win
% 2-1 = 1    -> win
% 2-2 = 0   -> tie
% 2-3 = -1 -> loss
% 3-1 = 2  -> loss
% 3-2 = 1    -> win
% 3-3 = 0   -> tie
% if 0 tie, if 1 or -2 win, if -1 or 2 loss


%%
for i = 1:length(Key)
    Outcome = Key(i,2) - Key(i,1);
    if Outcome == 0 % tie
        Points = Points + 3+ Key(i,2);
        fprintf("tie\n")
    elseif (Outcome == 1) || (Outcome == -2) % win
        Points = Points + 6 + Key(i,2);
        fprintf("win\n")
    elseif (Outcome == -1) || (Outcome == 2) % loss
        Points = Points + Key(i,2);
        fprintf("loss\n")
    else
        fprintf("Why are you seeing this? Something went wrong.\n")
    end
        
end

fprintf("Total Points = %1.0f\n", Points)