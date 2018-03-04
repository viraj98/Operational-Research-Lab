% Viraj Patel
% 16IM10028
% --- Desert trek Vehicle Problem --------%%%
%---  Decision Variables -------------- %%%
% xi is corresponding to i th item where i = 1,2,3,4,5,6,7
% Objective function => Z = Max 250x1 + 300x2 + 500x3 + 700x4 + 750x5 + 900x6 + 950x7
%% -------- Constraints -----%%%%%%%
% -- Volume Constraints --
% .55x1 + .6x2 + .7x3 + .75x4 + .85x5 + .9x6 + .95x7 <= 3.6
% -- Number of units Constraints --
% xi <= 1 where i is 1,2,3,4,5,6,7
%---------------------------------------------------------------------------------------
C = [-250;-300;-500;-700;-750;-900;-950];
A = [.55 .6 .7 .75 .85 .9 .95;
      1 0 0 0 0 0 0;
      0 1 0 0 0 0 0;
      0 0 1 0 0 0 0;
      0 0 0 1 0 0 0;
      0 0 0 0 1 0 0;
      0 0 0 0 0 1 0;
      0 0 0 0 0 0 1];
b = [3.6;1;1;1;1;1;1;1];
lb = [0 0 0 0 0 0 0];
intcon = [1:7];
[x,fval] = intlinprog(C,intcon,A,b,[],[],lb);
for i=1:7
    if x(i)==1
        fprintf('Item %d is selected : %d \n', i, x(i));
    else
        fprintf('Item %d is not selected : %d \n', i, x(i));
    end
end
fprintf ('Net Value is : %d \n',  (-fval));
