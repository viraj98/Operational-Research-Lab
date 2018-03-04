% Viraj Patel
% 16IM10028
% ------ Flight Luggage Problem --------
% ------   Decision Variables    -------
% xi is corresponding to i th item where i = 1,2,3,4,5,6
% Objective function => Z = Max 60x1 + 70x2 + 40x3 + 70x4 + 16x5 + 100x6
%% -------- Constraints -----%%%%%%%
% -- Weight Constraints --
% 6x1 + 7x2 + 4x3 + 9x4 + 3x5 + 8x6 <= 20
% -- Value of variable Constraints --
% xi <= 1 where i is 1,2,3,4,5,6
% ---------------------------------------------------------------------------------------
C = [-60 -70 -40 -70 -16 -100];
A = [6 7 4 9 3 8;
     1 0 0 0 0 0;
     0 1 0 0 0 0;
     0 0 1 0 0 0;
     0 0 0 1 0 0;
     0 0 0 0 1 0;
     0 0 0 0 0 1];
b = [20;1;1;1;1;1;1];
lb = [0 0 0 0 0 0];
intcon = [1:6];
[x,fval] = intlinprog(C,intcon,A,b,[],[],lb);
for i=1:6
    if int8(x(i))==0
        fprintf('Item %d is not selected\n',i)
    else
        fprintf('Item %d is selected\n',i);
    end
end
fprintf ('Net Value is : %d \n',  (-fval));
