% [N]     [Q]         [N]            
% [R]     [F] [Q]     [G] [M]        
% [J]     [Z] [T]     [R] [H] [J]    
% [T] [H] [G] [R]     [B] [N] [T]    
% [Z] [J] [J] [G] [F] [Z] [S] [M]    
% [B] [N] [N] [N] [Q] [W] [L] [Q] [S]
% [D] [S] [R] [V] [T] [C] [C] [N] [G]
% [F] [R] [C] [F] [L] [Q] [F] [D] [P]
%  1   2   3   4   5   6   7   8   9 

% imported move data in Google Sheets and parced it. Data is
% [Quant][From][To]
clear all
load Day5Input.mat

% construct a cell of characters arrays to manipulation index 1 is the "bottom' of the stack
% flip becuase derp and lazy

Stack1 = flip('FDBZTJRN');
Stack2 = flip('RSNJH');
Stack3 = flip('CRNJGZFQ');
Stack4 = flip('FVNGRTQ');
Stack5 = flip('LTQF');
Stack6 = flip('QCWZBRGN');
Stack7 = flip('FCLSNHM');
Stack8 = flip('DNQMTJ');
Stack9 = flip('PGS');

fprintf("1 "+string(Stack1)+"\n"+"2 "+string(Stack2)+"\n"+"3 "+string(Stack3)+"\n"+...
        "4 "+string(Stack4)+"\n"+"5 "+string(Stack5)+"\n"+"6 "+string(Stack6)+"\n"+...
        "7 "+string(Stack7)+"\n"+"8 "+string(Stack8)+"\n"+"9 "+string(Stack9)+"\n")
    

for i = 1:length(MoveList)
    Quant = MoveList(i,1);
    From = MoveList(i,2);
    To = MoveList(i,3);
    
    fprintf(string(i)+": Move Quant "+string(Quant)+" From "+string(From)+" To "+string(To)+"\n")
    
    switch From % pull From Stack
        case 1
            MoveChar = Stack1(1:Quant); % identify creats to move
            Stack1(1:Quant) = [];
        case 2
            MoveChar = Stack2(1:Quant); % identify creats to move
            Stack2(1:Quant) = [];
        case 3
            MoveChar = Stack3(1:Quant); % identify creats to move
            Stack3(1:Quant) = [];
        case 4
            MoveChar = Stack4(1:Quant); % identify creats to move
            Stack4(1:Quant) = [];
        case 5
            MoveChar = Stack5(1:Quant); % identify creats to move
            Stack5(1:Quant) = [];
        case 6
            MoveChar = Stack6(1:Quant); % identify creats to move
            Stack6(1:Quant) = [];
        case 7
            MoveChar = Stack7(1:Quant); % identify creats to move
            Stack7(1:Quant) = [];
        case 8
            MoveChar = Stack8(1:Quant); % identify creats to move
            Stack8(1:Quant) = [];
        case 9
            MoveChar = Stack9(1:Quant); % identify creats to move
            Stack9(1:Quant) = [];
        otherwise
            fprintf("DEEEEEERP THIS IS UGLY\n")
    end
    
    switch To % append moved creats to To stack and replace old ToStack
        case 1
            Stack1 = char(string(MoveChar)+string(Stack1));
        case 2
            Stack2 = char(string(MoveChar)+string(Stack2));
        case 3
            Stack3 = char(string(MoveChar)+string(Stack3));
        case 4
            Stack4 = char(string(MoveChar)+string(Stack4));
        case 5
            Stack5 = char(string(MoveChar)+string(Stack5));
        case 6
            Stack6 = char(string(MoveChar)+string(Stack6));
        case 7
            Stack7 = char(string(MoveChar)+string(Stack7));
        case 8
            Stack8 = char(string(MoveChar)+string(Stack8));
        case 9
            Stack9 = char(string(MoveChar)+string(Stack9));
        otherwise
            fprintf("This code is ugly and I hate it.\n")
    end
    
    fprintf("1 "+string(Stack1)+"\n"+"2 "+string(Stack2)+"\n"+"3 "+string(Stack3)+"\n"+...
            "4 "+string(Stack4)+"\n"+"5 "+string(Stack5)+"\n"+"6 "+string(Stack6)+"\n"+...
            "7 "+string(Stack7)+"\n"+"8 "+string(Stack8)+"\n"+"9 "+string(Stack9)+"\n\n")
    
end

