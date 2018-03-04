% Viraj Patel
% 16IM10028
% ------ Desert trek Vehicle Problem --------
% ------     Decision Variables      --------
% xi is corresponding to i th item where i = 1,2,3,4,5,6,7
%% -------- Constraints -----%%%%%%%
% -- Volume Constraints --
% .55x11 + .6x21 + .7x31 + .75x41 + .85x51 + .9x61 + .95x71 <= 3.6
% .55x12 + .6x22 + .7x32 + .75x42 + .85x52 + .9x62 + .95x72 <= 3.6
% .55x13 + .6x23 + .7x33 + .75x43 + .85x53 + .9x63 + .95x73 <= 3.6
% -- Number of units Constraints --
% x11 + x12 + x13 = 2
% x21 + x22 + x23 = 2
% x31 + x32 + x33 = 2
% x41 + x42 + x43 = 2
% x51 + x52 + x53 = 2
% x61 + x62 + x63 = 2
% x71 + x72 + x73 = 2
% ---------------------------------------------------------------------------------------
C = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
A = [.55 .6 .7 .75 .85 .9 .95 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ;
     0 0 0 0 0 0 0 .55 .6 .7 .75 .85 .9 .95 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 .55 .6 .7 .75 .85 .9 .95];
Aeq = [1 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0;
       0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0;
       0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0;
       0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0;
       0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0;
       0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 1 0;
       0 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 1];
beq = [2;2;2;2;2;2;2];      
      
b = [3.6;3.6;3.6];
lb = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
intcon = [1:21];
[x,fval] = intlinprog(C,intcon,A,b,Aeq,beq,lb);

fprintf ('Results\n');
for i=1:21
    if(i>0 && i<8)
        if (int8(x(i))==1)
            fprintf('1 Item %d is loaded in Truck 1\n',i);
        end
        if (int8(x(i))==2)
            fprintf('2 Item %d is loaded in Truck 1\n',i);
        end
    end
    if( i>7 && i<15)
        if (int8(x(i))==1)
            fprintf('1 Item %d is loaded in Truck 2\n',i-7);
        end
        if (int8(x(i))==2)
            fprintf('2 Item %d is loaded in Truck 2\n',i-7);
        end
    end
    if(i>14 && i<22)
        if (int8(x(i))==1)
            fprintf('1 Item %d is loaded in Truck 3\n',i-14);
        end
        if (int8(x(i))==2)
            fprintf('2 Item %d is loaded in Truck 3\n',i-14);
        end
    end
end

