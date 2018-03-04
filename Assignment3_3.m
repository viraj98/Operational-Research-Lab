% Viraj Patel
% 16IM10028
% ---  Minimum Employees Problem  -------
% ---      Decision Variables     -------
% xi = Number of employees starts to work on Monday,Tuesday.....Sunday.
% Objective function, Z = Min (x1 + x2 + x3 + x4 + x5 + x6 + x7) 
%% ---- Constraints -----%%
% -- Minimum employees needed --
% x1 + x4 + x5 + x6 + x7 >= 17
% x2 + x5 + x6 + x7 + x1 >= 13
% x3 + x6 + x7 + x1 + x2 >= 15
% x4 + x7 + x1 + x2 + x3 >= 19
% x5 + x1 + x2 + x3 + x4 >= 14
% x6 + x2 + x3 + x4 + x5 >= 16
% x7 + x3 + x4 + x5 + x6 >= 11
% -- Non Negativity --
% xi >= 0
%---------------------------------------------------------------------------
C = [1 1 1 1 1 1 1];
A = [-1 0 0 -1 -1 -1 -1;
     -1 -1 0 0 -1 -1 -1;
     -1 -1 -1 0 0 -1 -1;
     -1 -1 -1 -1 0 0 -1;
     -1 -1 -1 -1 -1 0 0;
     0 -1 -1 -1 -1 -1 0;
     0 0 -1 -1 -1 -1 -1];
b = [-17 -13 -15 -19 -14 -16 -11];
lb = [0 0 0 0 0 0 0];
intcon = 1:7;
[x,fval] = intlinprog(C,intcon,A,b,[],[],lb);
fprintf('Minimum Number of Employees Required is : %d\n',sum(x));

 
