% Viraj Patel
% 16IM10028
% ---  Shipping Problem  -------
% --- Decision Variables -------
% xij = number of units transported from i to j where i&j = 1,2,3 : xij>=0
% yij = number of units transported from warehouse i to demand point j
% where i = 1,2,3 & j = 1,2,3,4  yij >= 0
% Objective function, Z = Min 5000*x11 + 3000*x12 .........8000*y34 
%% --- Constraints -----%%%%%%%
% -- Warehouse Constraints --
% x11 + x21 + x31 >= y11 + y12 + y13 + y14
% x12 + x22 + x32 >= y21 + y22 + y23 + y24
% x13 + x23 + x33 >= y31 + y32 + y33 + y34
% -- Demand point Constraints --
% y11 + y21 +y31 >= 50
% y12 + y22 + y32 >= 130
% y13 + y23 + y33 >= 75
% y14 + y24 + y34 >= 90
%----------------------------------------------------------------------------------------

C = [5000;3000;6500;6000;3200;2500;5500;2300;6200;6000;4500;5000;4000;5500;3200;2500;4700;5500;2300;6200;8000];
A = [-1 0 0 -1 0 0 -1 0 0 1 1 1 1 0 0 0 0 0 0 0 0;
     0 -1 0 0 -1 0 0 -1 0 0 0 0 0 1 1 1 1 0 0 0 0;
     0 0 -1 0 0 -1 0 0 -1 0 0 0 0 0 0 0 0 1 1 1 1;
     0 0 0 0 0 0 0 0 0 -1 0 0 0 -1 0 0 0 -1 0 0 0;
     0 0 0 0 0 0 0 0 0 0 -1 0 0 0 -1 0 0 0 -1 0 0;
     0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 -1 0 0 0 -1 0;
     0 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 -1 0 0 0 -1;];
 b = [0;0;0;-50;-130;-75;-90];
 lb = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
 intcon = [1:21];
 [x,fval] = intlinprog(C,intcon,A,b,[],[],lb);
 
 fprintf (' Total cost is : %d \n',  (fval));
%for i=1:21
%    fprintf(' Number of units % d is : %d \n', i, x(i));
%end