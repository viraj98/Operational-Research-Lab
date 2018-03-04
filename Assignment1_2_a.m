clc;
%VIRAJ PATEL
%16IM10028
%----MIlk Fat Problem
%----Decision Variables
% xi = Amount of milk Product of Type i, i=1,2,3,4,5,xi>=0
%Type 1,2,3,4,5 is Skimmed Milk, 2%, Whole Milk, Table Cream, Whipping Cream respectively.
%Objective Function :Z = Max 5x1 + 7.5x2 + 10x3 + 85x4 + 400x5
%------Constrains
% Total Milk Constraint 
% x1 + x2 + x3 + x4 + x5 <= 7500  (in litres)
% Fat Constraint 
% 0x1 + 0.02x2 + 0.04x3 + 0.15x4 + 0.45x5 <= 307.5
%-------------------------------------------------------------------------
C = [-5 -7.5 -10 -85 -400];
A = [1 1 1 1 1;0 .02 .04 .15 .45];
b = [7500 307.5];
lb = [0 0 0 0 0];
[x,fval] = linprog(C,A,b,[],[],lb);
fprintf (' Total Profit is : %d \n',  (-fval));
for i=1:5
    fprintf(' Unit of item% d produced is : %d \n', i, x(i));
end