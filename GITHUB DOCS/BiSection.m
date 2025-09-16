function x = BiSection( x0, x1, f )
%
% Function that uses Bisection to search for root of f(x)
% Inputs: x0 and x1 - inital points used in iteration
%         f - function to be searched.
% Outputs: x - critical point found by BiSection, 
%              and if null [] not a bracket.
%
    
fx0 = f(x0);
fx1 = f(x1);
% if f(x) at the initial end points have the same sign
if fx0*fx1 > 0
    % return with warning and a null matrix.
    %disp('Invalid initial end points given' );
    x = [];
    return;
end
% Loop until x0 and x1 are basically the same.
while abs(x0-x1)/abs(x0+x1) > 2*eps
    x2 = (x0+x1)/2; % x2 is mid point.
    fx2 = f(x2); % compute f(x2)
    if fx0*fx2 > 0 % if fx0 and fx2 are of the same sign
        x0 = x2; % replace x0 with x2.
        fx0 = fx2;
    else
        if fx1*fx2 > 0 % if fx1 and fx2 are of the same sign
            x1 = x2; % replace x1 with x2.
            fx1 = fx2;
        else
            x0 = x1;
        end
    end %end of if
end % end of while

x = x0; % save last point.
