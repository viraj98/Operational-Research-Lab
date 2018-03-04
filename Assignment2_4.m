% Viraj Patel
% 16IM10028
% ------- Swimming pool problem ---------
% -------   Decision variables  ---------
% xi = 1, if Lifeguard i is selected for the post
% xi = 0, if lifeguard i is not selected where i=1,2...7
% -- Objective function: Z = Min (300x1 + 180x2 + 210x3 + 380x4 + 200x5 + 220x6 + 900x7)
%% -------- Constraints -----%%%%%%%
% -- Time constraint for each time slot from 1-9 --
% x1 + x2 >= 1           => -x1 - x2 <= -1           (for time slot 1-2 and 2-3)
% x1 >= 1                => -x1 <= -1                (for time slot 3-4)
% x1 + x3 + x4 >= 1      => -x1 - x3 - x4 <= -1      (for time slot 4-5)
% x3 + x4 + x6 >= 1      => -x3 - x4 - x6 <= -1      (for time slot 5-6)
% x3 + x4 + x5 + x6 >= 1 => -x3 - x4 - x5 - x6 <= -1 (for time slot 6-7)
% x4 + x5 + x6 >= 1      => -x4 - x5 - x6 <= -1      (for time slot 7-8)
% x4 + x5 + x7 >= 1      => -x4 - x5 - x7 <= -1      (for time slot 8-9)
% -- Integer and no negativity constraint --
% xi >= 0 and xi <= 1 for all i = 1,2,...7
% -----------------------------------------------------------------------------
C = [300;180;210;380;200;220;900];
A = [-1,-1,0,0,0,0,0;
     -1,0,0,0,0,0,0;
     -1,0,-1,-1,0,0,0;
      0,0,-1,-1,0,-1,0;
      0,0,-1,-1,-1,-1,0;
      0,0,0,-1,-1,-1,0;
      0,0,0,-1,-1,0,-1];
b = [-1;-1;-1;-1;-1;-1;-1];
intcon = [1:7];
lb = [0;0;0;0;0;0;0;];
ub = [1;1;1;1;1;1;1;];
[x,fval] = intlinprog(C,intcon,A,b,[],[],lb,ub);
for i=1:7
    if x(i)==1
        fprintf('Lifeguard %d is Chosen for the job\n',i);
    else
        fprintf('Lifeguard %d is not Chosen for the job\n',i);
    end
end
fprintf('The Optimum cost is : %d',fval);