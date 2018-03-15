function [ fval,x,D,flag ] = BigM_Algorithm_Matlab(c,A,b,A1,b1)
%% LP Problem 
%% Max c'x 
%% S.t. Ax <= b and A1x = b1
%% x >= 0 
%% c and b are column Vectors and A is  Matrix
m1 =length(b);
m2 =length(b1);
n1 =length(c);
M = 10*max(abs(c));
A = vertcat(A,A1);
A = [A,eye(m1+m2)];
b = vertcat(b,b1);
for i =1:m1
    c(n1+i)=0;
end
for i =1:m2
    c(n1+m1+i)=-M;
end
flag = 0;
%% Intial Basic Feasible Solution 
[m,n] = size (A);
IB = n-m+1:n;    % Set Indices of Initial basic variable B default to last m columns of  A
x = zeros (n,1); % initialize  x vector 
                 % find first basic solution solution
B = A(:,IB);     % Intial Basic variables 
x(IB) = B\b;     % Intial basic solution of x (Same as inv(B)*b
D = zeros(n,1);  % intialize the direction
fval = c'*x ;    % calculate the function value 
%% ========== condition check for optimality and next iteration
cbar = c' - c(IB)'/B*A;     % cost reduction calculation with current basic 
[cbarval, ex] = max(cbar);  % find the entering varble
                            % ex entering basic variable  
%% If optimality condition has not reached then subsequent steps
iter = 0;
while (cbarval >0)
    iter = iter+1;
    disp('-------------------------------------------------------------');
    fprintf('Iteration : %d \n',iter);   
    fprintf('Entering varible : x%d \n',ex);
                          % calculate the direction 'D' 
    D = zeros(n,1);       % intialize the direction first
    D(IB) = -B\A(:,ex);   % set the direction of basic variables
    D(ex) =1;             % set the direction of entering variable
    % Checking for Degenerate solution
    for i=1:1:m
           if (x(IB(i))==0)
               d=IB(i);
               fprintf('Basic Solution is Degenerate since basic variable x%d falls to 0\n',d);
           end
    end
%   finding leaving variable
    theta = -x(IB)./D(IB);
%   Discarding theta with negative value
    for i =1:m
            if theta(i) <= 0
                theta (i) = inf;
            end
    end
%   Taking minimum theta to abide non- negativity constrained of x
%   lx is the leaving basic variables 
    [theta,lx] = min(theta);
    fprintf('Leaving variable : x%d \n',IB(lx));
    if (theta == inf)
        disp('Solution is unbounded')
        flag =1;
        D(ex)=1;
        x(n1+m1+1:n1+m1+m2)=[];
        D(n1+m1+1:n1+m1+m2)=[];
        return
    end
    IB(lx) = ex;      % update basic variable indices i.e. repace lx with ex
    x = x+ theta*D;   % Update X
    B= A(:,IB);       % Update Basic Matrix 
    fval = c'*x;      % Calculate function value
    fprintf('Optimum value of iteration : %d \n',fval);
    cbar = c' - c(IB)'/B*A;
    y=1:n;
        for i=1:1:m
            y=y(y~=IB(i));
        end
        for i=1:1:(n-m)
            if (cbar(y(i))==0)
                fprintf('It has Multiple Optimal Solution\n');
            end
        end
%   find the entering varble
    [cbarval,ex] = max(cbar);
end
   x(n1+m1+1:n1+m1+m2)=[];
   D(n1+m1+1:n1+m1+m2)=[];
if (cbarval <= 0)
    disp('Optimality reached');
%     disp(x);
end
end
%% Test Example
% c=[3;5];
% a=[1,0;0,2];
% a1=[3,2];
% b=[4;12];
% b1=[18];
% [fval,x,D,flag] = BigM_Algorithm_Matlab(c,a,b,a1,b1);

