clc;
% --- Job Sequence Problem ----
% --   Decision Variable    ----
% xij = 1 if we move from job i to job j and 0 otherwise
% Objective function, Min Z = 4x12+7x13+3x14+4x21+6x23+3x24+7x31+6x32+7x34+3x41+3x42+7x43
%% --- Constraints -----%%
% -- To Constraint --
% x12+x13+x14<=1
% x21+x23+x24<=1
% x31+x32+x34<=1
% x41+x42+x43<=1
% -- From Constraint --
% x21+x31+x41<=1
% x12+x32+x42<=1
% x13+x23+x43<=1
% x14+x24+x34<=1
% -- Sub-Tour Constraint --
% x12+x21<=1
% x13+x31<=1
% x14+x41<=1
% x23+x32<=1
% x24+x42<=1
% x34+x43<=1
% -- Path Selection Constraint --
% x12+x13+x14+x21+x23+x24+x31+x32+x34+x41+x42+x43=4
% --------------------------------------------------------------------------------------------
%% ---- %%
C = [4 7 3 4 6 3 7 6 7 3 3 7];
A = [1 0 0 1 0 0 0 0 0 0 0 0;
     0 1 0 0 0 0 1 0 0 0 0 0;
     0 0 1 0 0 0 0 0 0 1 0 0;
     0 0 0 0 1 0 0 1 0 0 0 0;
     0 0 0 0 0 1 0 0 0 0 1 0;
     0 0 0 0 0 0 0 0 1 0 0 1;
     1 1 1 0 0 0 0 0 0 0 0 0;
     0 0 0 1 1 1 0 0 0 0 0 0;
     0 0 0 0 0 0 1 1 1 0 0 0;
     0 0 0 0 0 0 0 0 0 1 1 1;
     0 0 0 1 0 0 1 0 0 1 0 0;
     1 0 0 0 0 0 0 1 0 0 1 0;
     0 1 0 0 1 0 0 0 0 0 0 1;
     0 0 1 0 0 1 0 0 1 0 0 0];
 b = [1;1;1;1;1;1;1;1;1;1;1;1;1;1];
Aeq = [1 1 1 1 1 1 1 1 1 1 1 1]; 
beq = 4;
 lb = [0 0 0 0 0 0 0 0 0 0 0 0];
 ub = [1 1 1 1 1 1 1 1 1 1 1 1];
 intcon = 1:12;
 [x,fval] = intlinprog(C,intcon,A,b,Aeq,beq,lb,ub);
fprintf('Minimum Time : %d\n',fval-7);
fprintf('Sequence is 1->4->2->3\n');


