function [time_TS, time_NR, time_at] = timing_test()
%   Timing test File which calls the other functions.
%   NOTE: ADD RELATIVE ERROR FINDING.
% Outputs:
%         time_TS - the time it takes for the TS of arctan to run.
%         time_NR - the time it takes for the NR of arctan to run.
%         time_at - the time it takes for the atan to run.
%
%

MaxTerms = 500;

time_TS = [];
time_NR = [];   % arrays to store time values.
time_at = [];

for x = 0.0:0.0001:0.99 % while there's 

    tic;
    TS_arctan(x, eps, MaxTerms);
    time_TS(end + 1) = toc;

    tic;
    NR_arctan(x, eps, MaxTerms);
    time_NR(end + 1) = toc;

    tic;
    atan(x);
    time_at(end + 1) = toc;

end
total_Time_TS = sum(time_TS);
average_Time_TS = mean(time_TS);
assignin('caller', 'total_Time_TS', total_Time_TS)
assignin('caller', 'average_Time_TS', average_Time_TS) % Assign the time to a workspace variable.

total_Time_NR = sum(time_NR);
average_Time_NR = mean(time_NR);
assignin('caller', 'total_Time_NR', total_Time_NR)
assignin('caller', 'average_Time_NR', average_Time_NR);

total_Time_at = sum(time_at);
average_Time_at = mean(time_at);
assignin('caller', 'average_Time_at', 'average_Time_at');
assignin('caller', 'average_Time_at', average_Time_at);

error_TS = [];
error_NR = [];

for x = 0.0:0.0001:0.99

    val = atan(x);
    error_TS(end + 1) = TS_arctan(x, eps, MaxTerms) - val;
    error_NR(end + 1) = NR_arctan(x, eps, MaxTerms) - val;

end

average_err_TS = mean(error_TS);
assignin('caller', 'average_err_TS', average_err_TS);

average_err_NR = mean(error_NR);
assignin('caller', 'average_err_NR', average_err_NR);