% Viraj Patel
% 16IM10028
% ---------   Flight problem   ---------
% --------- Decision variables ---------
% xi = 1, if item i is selected
% xi = 0, if item i is not selected where i=1,2,3,4,5,6
% Objective function:Z = Max (60x1 + 70x2 + 40x3 + 70x4 + 16x5 + 100x6)
%% -------- Constraints -----%%%%%%%
% -- Weight constraint --
% 6x1 + 7x2 + 4x3 + 9x4 + 3x5 + 8x6 <= 20 (Total weight should be less than 20)
% -- Constraint on selection of item 1 and 4 --
% x4 >= x1 => x1 - x4 <= 0 (Select D when A is selected but not vice versa)
% -- Integer and non negativity constraint --
% xi >= 0 and xi <= 1 where i = 1,2,3,4,5,6
% xi = integer for all i = 1,2,3,4,5,6
% --------------------------------------------------------------------------------------------
C = [-60;-70;-40;-70;-16;-100];
A = [6,7,4,9,3,8;
     1,0,0,-1,0,0];
b = [20,0];
intcon = [1:6];
lb = [0;0;0;0;0;0];
ub = [1;1;1;1;1;1];
[x,fval] = intlinprog(C,intcon,A,b,[],[],lb,ub);
for i=1:6
    if x(i)==0
        fprintf('Item %d is not selected\n',i)
    else
        fprintf('Item %d is selected\n',i);
    end
end
fprintf('The total value is:%f',-fval);
