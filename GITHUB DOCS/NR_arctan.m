function [y,terms] = NR_arctan( x, Tolerance, MaxTerms )
%
% [y,terms] = NR_arctan(x, Tolerance, MaxTerms )
%
% Computes arctan of the number x via a Newton-Raphson iteration,
% using either MaxTerms passes or
% having a relative step size < Tolerance
% relative step size = abs( yOld – y ) / abs( y )
%
% Input: x – Number that we want the arctan of.
%        b - Initial guess for arctan(x).
%        Tolerance – relative step size to terminate iteration.
%        MaxTerms – The maximum number of terms that are to be used.
%                   [default: 500]
% Output: y – arctan of x
%         terms = number of terms used.
% 

f = @(xn)x - tan(xn);   % The function f.
df = @(xn)sec(xn).^2;   % The derivative of function f.

y = x;                  % The output of our function, initially set to the guess b.

for k = 0:MaxTerms      % While we still want more terms...

    yOld = y;           % Set our old value.
    y = y + f(y)/df(y); % Calculate a new value.
    
    if(k ~= 0)          % If it is not the first iteration (WE NEED AN ACCURATE yOld),
        if(( abs(yOld - y) / abs(y) ) < Tolerance)  % If the relative step size is less than tolerance,
            break;      % End the loop.
        end
    end

end

terms = k + 1; % Set the output value for "terms" to be equal to our number of iterations (NOT INDEXED -> k + 1).


end