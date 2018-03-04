clc;
% ---   Rent Problem    ---
% -- Decision variables --
% xij represent amount of land to be rent from i th month and for j months duration
% where i = 1,2,3 and j = 1,2,3
% Objective function:Z = Min(28000x11 + 45000x12 + 60000x13 + 28000x21 + 45000x22 + 28000x31)
%% -- Constraints -- %%
% -- Space Constraint --
% -x11 - x12 - x13 <= -25        
% -x12 - x13 - x21 - x23 <= -10  
% -x13 - x22 - x31 <= -20        
% -- Non-Negativity and integer constraint --
% --------------------------------------------------------------------------------------------
%% ---- %%
C = [28000;45000;60000;28000;45000;28000];
A = [-1,-1,-1,0,0,0;
     0,-1,-1,-1,-1,0;
     0,0,-1,0,-1,-1];
b = [-25;-10;-20];
intcon = 1:6;
lb = [0;0;0;0;0;0;];
[x,fval] = intlinprog(C,intcon,A,b,[],[],lb);
fprintf('Total cost of renting is: %d\n',fval);
fprintf('The amount of land rented in 1st month for 1 month  is: %d\n',x(1));
fprintf('The amount of land rented in 1st month for 2 months is: %d\n',x(2));
fprintf('The amount of land rented in 1st month for 3 months is: %d\n',x(3));
fprintf('The amount of land rented in 2nd month for 1 month  is: %d\n',x(4));
fprintf('The amount of land rented in 2nd month for 2 months is: %d\n',x(5));
fprintf('The amount of land rented in 2nd month for 1 month  is: %d\n',x(6));
