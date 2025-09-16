function roots = BiSectionSearch( xStart, xStop, xStep, xOverlap, Function)
%
% Function that uses bisection to search for the roots of f(x)
% Inputs: xStart and xStep - the end points of the search.
% xStep – the size of interval used in search.
% xOverlap – the overlap between intervals.
% Function – the function to be searched.
% Outputs: roots - array of roots found in the search.
%   
    % The output array..
    roots = [];
    
    % INTERVAL 1
    x0 = xStart;
    x1 = x0 + xStep;
    
    while(x1 < xStop)               % while we are still in our interval,
    r = BiSection(x0,x1,Function);  % look for a root within the step size.

    if(~isempty(r))                 % If we find a root,
        roots(end + 1) = r;         % Add it to the root array.
    end

    x0 = x1-xOverlap;               % increment interval bounds.
    x1 = x0 + xStep;

    end
end