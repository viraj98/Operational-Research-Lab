clc;
%VIRAJ PATEL
%16IM10028
%----- CO-Tech Problem
%----- Decision Variables 
% x1,x2,x3,x4,x5,x6,x7 = Salary of A,B,C,D,E,F,G respectively(in Rs.)
% Objective Function : Z = Min x1+x2+x3+x4+x5+x6+x7 
%------ Constraints 
% Constraint 1 : x1>=20000        => A >= 20000
% Constraint 2: x2-x1>=5000       => B >= A + 5000
% Constraint 3: x3-x1>=5000       => C >= A + 5000
% Constraint 4: x4-x1>=5000       => D >= A + 5000
% Constraint 5: x5-x1-x2>=0       => E >= A + B
% Constraint 6: x6-x5=200         => F = E +200
% Constraint 7: x3+x4-2(x1+x2)>=0 => C + D >= 2*(A + B)
% Constraint 8: x7-x4>=0          => G >= B
% Constraint 9: x7-x2>=0          => G >= D
% Constraint 10: x7+x2>=60000     => G + B >= 60000
% Constraint 11: x6-x7-x1<=0      => F <= A + G
%-------------------------------------------------------------
f = [1;1;1;1;1;1;1];
A = [-1,0,0,0,0,0,0;
     1,-1,0,0,0,0,0;
     1,0,-1,0,0,0,0;
     1,0,0,-1,0,0,0;
     1,1,0,0,-1,0,0;
     2,2,-1,-1,0,0,0;
     0,0,0,1,0,0,-1;
     0,1,0,0,0,0,-1;
     0,-1,0,0,0,0,-1;
     -1,0,0,0,0,1,-1];
b = [-20000;-5000;-5000;-5000;0;0;0;0;-60000;0];
lb = [0;0;0;0;0;0;0];
Aeq = [0,0,0,0,-1,1,0];
beq = [200];
[x,fval] = linprog(f,A,b,Aeq,beq,lb);
fprintf (' Total Salary Expenses is : %d \n',  fval);
for i=1:7
    fprintf(' Salary of Employee x%d is : %d \n', i, x(i));
end
