function [y,terms] = TS_arctan( x, Tolerance, MaxTerms )
%
% [y,terms] = TS_arctan(x, Tolerance, MaxTerms )
%
% Computes arctan of the number x via a Taylors Series,
% using either MaxTerms terms or
% having a relative step size < Tolerance
% relative step size = abs( yOld – y ) / abs( y )
%
% Input: x – Number that we want the arctan of.
% Tolerance – relative step size to terminate series.
% MaxTerms – The maximum number of terms that are to be used.
% [default: 500]
% Output: y – arctan of x
% terms – number of terms used.
%

term = x;   %#ok<NASGU> % The current term calculated.
y = 0;      % the current output.

for k = 0:MaxTerms      % While we still want more terms...

    yOld = y;                                           % store the previous y value as yOld.
    term = (-1)^k * ((x ^ ( 2 * k + 1)) / (2 * k + 1)); % calculate a new term.
    y = y + term;                                       % update the output.

    if(k ~= 0)          % If it is not the first iteration (WE NEED AN ACCURATE yOld),
        if(( abs(yOld - y) / abs(y) ) < Tolerance)  % If the relative step size is less than tolerance,
            break;      % End the loop.
        end
    end

end
terms = k;  % Update the output iteration #.

end