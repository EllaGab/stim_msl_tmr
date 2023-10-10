function [quit, secs, timeElapsed, key2readPressed] = ld_timeWait(time2wait, keys2read)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [quit, secs, ttlKeyPressed, key2readPressed] = ld_timeWait()
% [quit, secs, key2readPressed] = ld_timeWait(time2wait)
% [quit, secs, key2readPressed] = ld_timeWait(time2wait, keys2read)
%
% Wait for a given period of time, one of the expected keys or the ESC key to exit
%
% INPUT
%   time2wait       time to wait, in seconds; DEFAULT: 5 secs
%   keys2read       cell array with expected keys; other keys are ignored
%
% OUTPUT:
%   quit            exit before the end (esc)? (0: no; 1:yes)
%   secs            the time the expected key of ESC key was pressed
%   timeElapsed     1 - the time to wait is over, 0 - otherwise
%   key2readPressed 1 - one of the expected keys was pressed, 0 - otherwise     
%
% Ella Gabitov 10 October 2023
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin < 2, keys2read = []; end
if nargin < 1, time2wait = 5; end

quit = 0;
key2readPressed = 0;

% Get the current time
timeStart = tic;

timeElapsed = toc(timeStart) >= time2wait;

while ~timeElapsed && ~quit && ~key2readPressed
    [secs, keyCode, ~] = KbPressWait([]);
    keyName = KbName(keyCode);
    if ~isempty(keyName)
        if ~iscell(keyName), keyName = {keyName}; end
        quit = any(contains(lower(keyName), 'esc'));
        if ~isempty(keys2read)
            key2readPressed = any(contains(lower(keyName), lower(keys2read)));
        end
    end
    timeElapsed = toc(timeStart) >= time2wait;
end

end
