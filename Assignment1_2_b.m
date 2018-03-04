clc;
%VIRAJ PATEL
%16IM10028
%----MIlk Fat Problem
%----Decision Variables
% xi=Amount of milk Produced of Type i, i=1,2,3,4,5,xi>=0
% x6 is the total amount of  fat in skimmed milk
%Type 1,2,3,4,5=Skimmed Milk,2%,Whole Milk,Table Cream,Whipping Cream 
%Objective Function :Z = Max 5x1 + 7.5x2 + 10x3 + 85x4 + 400x5
%------Constraints
% Total Milk Constraint
% x1 + x2 + x3 + x4 + x5 <= 7500 (in litres)
% Fat Constraint 
% 0x1 + 0.02x2 + 0.04x3 + 0.15x4 + 0.45x5 + x6 <= 307.5
% Skimmed Milk Fat Constraint
% x6 <= 0.001x1
C = [-5;-7.5;-10;-85;-400;0];
A = [1,1,1,1,1,0;
  0,0.02,0.04,0.15,0.45,0;
  -0.001,0,0,0,0,1];
b = [7500;307.5;0];
lb = [0;0;0;0;0;0;];
[x,fval] = linprog(f,A,b,[],[],lb);
fprintf('The Profit is: %d\n',-fval);
for i=1:5
    fprintf('The amount of milk product of Type %d is %d:\n ',i,x(i))
end;