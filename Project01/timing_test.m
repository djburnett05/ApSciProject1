function [time_TS, time_NR, time_at] = timing_test()
%   Timing test File which calls the other functions.
%   NOTE: ADD RELATIVE ERROR FINDING.
% Outputs:
%         time_TS - the time it takes for the TS of arctan to run.
%         time_NR - the time it takes for the NR of arctan to run.
%         time_at - the time it takes for the atan to run.
%
%
time_TS = [];
time_NR = [];
time_at = [];

for x = 0.0:0.0001:0.99

    tic;
    TS_arctan(x, eps, 500);
    time_TS(end + 1) = toc;

    tic;
    NR_arctan(x, x, eps, 500);
    time_NR(end + 1) = toc;

    tic;
    atan(x);
    time_at(end + 1) = toc;

end
for x = 0.0:0.0001:0.99
    
end

