% https://adventofcode.com/2022/day/2

% Data was parced in Google Sheets, saved as CSV, imported as a string
% array and and saved as a .mat file for later use.
load Day2Input.mat

% Anyway, the second column says how the round needs to end: X means you 
% need to lose, Y means you need to end the round in a draw, and Z means 
% you need to win. Good luck!"

% for part 2 I'll rebuild the game history data set and then use part 1
% code

% loop though each game and tally score
% 1 for Rock, 2 for Paper, and 3 for Scissors
% 3 for win, 0 for loss

Input = strrep(Day2Input,'A','R');
Input = strrep(Input,'B','P');
Input = strrep(Input,'C','S');
Input = strrep(Input,'X','L');
Input = strrep(Input,'Y','D');
Input = strrep(Input,'Z','W');

% Games = zeros(2,length(Input));

for i = 1:length(Input)
    Games(i,1) = Input(i,1);
    switch Input(i,2)
        case 'L'
            switch Input(i,1)
                case "R"
                    Games(i,2) = "S";
                case "P"
                    Games(i,2) = "R";
                case "S"
                    Games(i,2) = "P";
                otherwise
                    fprintf("L case didn't parse right")
            end
        case "W"
            switch Input(i,1)
                case "R"
                    Games(i,2) = "P";
                case "P"
                    Games(i,2) = "S";
                case "S"
                    Games(i,2) = "R";
                otherwise
                    fprintf("W case didn't parse right")
            end
        case "D"
            switch Input(i,1)
                case "R"
                    Games(i,2) = "R";
                case "P"
                    Games(i,2) = "P";
                case "S"
                    Games(i,2) = "S";
                otherwise
                    fprintf("D case didn't parse right")
            end
        otherwise
            fprintf("Somehow the input L/W/D didn't parse right\n")
    end
end


% R P S - A B C - 1 2 3
% converting RPS to 123
Games = strrep(Games,'R','1');
Games = strrep(Games,'P','2');
Games = strrep(Games,'S','3');


Key = str2double(Games);
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