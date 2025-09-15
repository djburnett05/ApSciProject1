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

term = x;   % The current term calculated.
k = 0;      % The current iteration #.
y = 0;      % the current output.

while( k < MaxTerms ...         
        && abs(term) > Tolerance)

    term = (-1)^k * ((x ^ ( 2 * k + 1)) / (2 * k + 1)); % calculate a new term.
    y = y + term;                                       % update the output.
    k = k + 1;                                          % update the iteration number.

end
terms = k;  % Update the output iteration #.

end
