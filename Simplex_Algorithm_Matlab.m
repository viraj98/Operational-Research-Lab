function [fval,x] = Simplex_Algorithm_Matlab(C, A, b )
%Simplex Implementation in Matlab
%% LP Problem 
%% Max c'x 
%% S.t. Ax <= b
%% x >= 0 
%% c and b are column Vectors and A is  Matrix
m1 =length(b);
n1 =length(C);
A = [A,eye(m1)];
for i =1:m1
    C(n1+i)=0;
end
%% Intial Basic Feasible Solution 
[m,n] = size (A);           % Getting size of A 
IB = n-m+1:n;               % Set Indices of Initial basic variable B default to last m columns of  A
x = zeros (n,1);            % Initialize x vector
B = A(:,IB);                % Intial Basic variables 
x(IB) = B\b;                % Intial basic solution of x=B(inv)*b
fval = C'*x;                % calculate the function value(C' is transpose of C) 
%% condition check for optimality and next iteration
cbar = C' - C(IB)'/B*A;     % Cost reduction calculation with current basic( C' - C'b(inv)*A)
[cbarval, ex] = max(cbar);  % find the entering varble
                            % ex entering basic variable 
%% If optimality condition has not reached then subsequent steps
iter = 0;
while (cbarval > 0)
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
    % Finding leaving variable 
    theta = -x(IB)./D(IB);
    % Discarding theta with negative value 
    for i =1:m
            if theta(i) <= 0
                theta (i) = inf;
            end
    end
    % Taking minimum theta to abide non- negativity constrained of x
    [theta,lx] = min(theta);   % lx is the leaving basic variables 
    if (theta~=inf)
        fprintf('Leaving variable : x%d \n',IB(lx));
        IB(lx) = ex;      % update basic variable indices i.e. repace lx with ex
        x = x+ theta*D;   % Update X
        B= A(:,IB);       % Update Basic Matrix 
        fval = C'*x;      % Calculate function value  
        fprintf('Optimum value of iteration : %d \n',fval);
        cbar = C' - C(IB)'/B*A;
        % Checking the condition for multiple optimal solution  
        y=1:n;
        for i=1:1:m
            y=y(y~=IB(i));
        end
        for i=1:1:(n-m)
            if (cbar(y(i))==0)
                fprintf('It has Multiple Optimal Solution\n');
            end
        end
        [cbarval,ex] = max(cbar);   % find the entering varble
    % Checking the condition of unbounded problem
    else
        fprintf('No leaving variable found\nZ is unbounded\n');
    break;
    end
end
if (cbarval <= 0)
    disp('Optimality reached')
end
end

%% Test Examples
%% Multiple Optimum Solution
% c = [3;2];
% a = [1,0;0,2;3,2];
% b = [4;12;18];
% [fval,x] = Simplex_Algorithm_Matlab(c,a,b);
%% Unbounded
% c = [1;1];
% a = [2,1;1,2];
% b = [4;3];
% [fval,x] = Simplex_Algorithm_Matlab(c,a,b);
%% Degeneracy
% c = [3;9];
% a = [1,4;1,2];
% b = [8;4];
% [fval,x] = Simplex_Algorithm_Matlab(c,a,b);
