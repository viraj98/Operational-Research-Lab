clc;
%VIRAJ PATEL
%16IM10028
% ---- CRUD chemical Plant Problem
% ---- Decision Variables
% x1,x2,x3,x4,x5,x6 is Litres Of Chemical Y sent to Plant at 10am,11am,12pm,1pm,2pm,3pm.
% Objective Function: Z = Min 30x1 + 40x2 + 35x3 + 45x4 + 38x5 + 50x6 
% ----- Constraints
% -- Limit of chemical Y on site 1000 ltr
% x1 <= 300
% x1+x2 <= 540
% x1+x2+x3 <= 1140
% x1+x2+x3+x4 <= 1340
% x1+x2+x3+x4+x5 <= 1640
% 300+240+600-x1-x2-x3 <= 1000
% 300+240+600+200-x1-x2-x3-x4 <= 1000
% 300+240+600+200+300-x1-x2-x3-x4-x5 <= 1000
% -- Chemical Y is not allowed to be left overnight 
% x1 + x2 + x3 + x4 + x5 + x6 = 2540
%--------------------------------------------------------------------------
C = [30;40;35;45;38;50];
A = [1,0,0,0,0,0;
     1,1,0,0,0,0;
     1,1,1,0,0,0;
     1,1,1,1,0,0;
     1,1,1,1,1,0;
     -1,-1,-1,0,0,0;
     -1,-1,-1,-1,0,0;
     -1,-1,-1,-1,-1,0];
b = [300;540;1140;1340;1640;-140;-340;-640];
Aeq = [1,1,1,1,1,1];
beq = [2540];
lb = [0;0;0;0;0;0];
[x,fval] = linprog(C,A,b,Aeq,beq,lb);
fprintf (' Total Cost of recycling is : %d \n',  fval);
for i=1:6
    fprintf(' Amount of Chemical to send to recycling at time %d:00 is : %d \n', i+9, x(i));
end
