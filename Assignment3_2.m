% Viraj Patel
% 16IM10028
% ---  Manufacturing Company Problem  -------
% ---        Decision Variables       -------
% x1,x2,x3 = number of units of type A,B,C and produced 
% Objective function, Z = Max 1/3*(-5x1 + x2 + x3 -7x1 + 6x2 + 10x3 + 13x1 - 2x2 + 6x3)  
%% ---- Constraints -----%%
% -- Total Quantity --
% x1 + x2 + x3 <= 2400
% -- Non Negativity --
% x1,x2,x3 >= 0
% ---------------------------------------------------------------------------------------
C = [-1 -5 -17];
A = [1 1 1];
b = [2400];
lb = [0 0 0];
intcon = [1:3];
[x,fval] = intlinprog(C,intcon,A,b,[],[],lb);
fprintf (' Number of units A : %d  \n',x(1));
fprintf (' Number of units B : %d  \n',x(2));
fprintf (' Number of units C : %d  \n',x(3));
%% 2nd Method using Multiobjective Genetic Algorithm %%
fprintf('2nd Method Using Multiobjective Genetic Algorithm\n')
fitness = @Price_level;
[x1,fval1] = gamultiobj(fitness,3,A,b,[],[],lb);
fprintf (' Number of units A : %d  \n',x1(1));
fprintf (' Number of units B : %d  \n',x1(2));
fprintf (' Number of units C : %d  \n',x1(3));
