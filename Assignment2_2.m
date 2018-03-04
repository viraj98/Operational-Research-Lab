% Viraj Patel
% 16IM10028
% --------   Network problem  --------
% -------- Decision variables --------
% xij = No of items transported from node i to node j.  
% x12,x13,x24,x52,x54,x32,x36,x43,x46
% Objective function: Z = Min (x12 + 4x13 + x24 + 3x32 + x36 + x43 + x46 + x52 + 3x54)
%% -------- Constraints -----%%%%%%%
% --Supply constraint --
% x12 + x13 <= 10 (Supply from node 1)
% x52 + x54 <= 15 (Supply from node 5)
% -- Demand constraint --
% x13 + x43 - x32 - x36 >= 11 => -x13 - x43 + x32 + x36 <= -11 (Demand at node 3)
% x24 + x54 - x43 - x46 >= 10 => -x24 - x54 + x43 + x46 <= -10 (Demand at node 4)
% x36 + x46 >= 4              => -x36 - x46 <= -4              (Demand at node 6)
% -- Supply & demand constraint -- 
% x12 + x32 + x52 = x24 => x12 + x32 + x52 - x24 = 0 (Supply=demand for node 2)
% ---------------------------------------------------------------------------------------------
C = [1;4;1;3;1;1;1;1;3];
A = [1,1,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,1,1;
    0,-1,0,1,1,-1,0,0,0;
    0,0,-1,0,0,1,1,0,-1;
    0,0,0,0,-1,0,-1,0,0];
b = [10;15;-11;-10;-4];
Aeq = [1,0,-1,1,0,0,0,1,0];
beq = [0];
lb = [0;0;0;0;0;0;0;0;0;];
intcon = [1:9];
[x,fval] = intlinprog(C,intcon,A,b,Aeq,beq,lb);
fprintf('Minimum cost is : %d\n',fval);
