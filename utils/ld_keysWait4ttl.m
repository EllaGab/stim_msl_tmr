function [quit, secs, ttlKeyPressed, key2readPressed] = ld_keysWait4ttl(keys2read)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [quit, secs, ttlKeyPressed, key2readPressed] = ld_keysWait4ttl()
% [quit, secs, ttlKeyPressed, key2readPressed] = ld_keysWait4ttl(keys2read)
%
% Wait for a key to present the stimulus (e.g., play the sound) or the TTL
% key (sent from the scanner or pressed by the experimenter) to initiate
% the task
%   TTL key = 5
%   ESC to exit
%
% INPUT
%   keys2read       cell array with expected keys; other keys are ignored
%
% OUTPUT:
%   quit            exit before the end (esc)? (0: no; 1:yes)
%   secs            the time the expected key was pressed
%   ttlKeyPressed   1 - TTL key was pressed, 0 - otherwise
%   key2readPressed 1 - one of the expected keys was pressed, 0 - otherwise     
%
% Ella Gabitov 13 October 2022
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin < 1, keys2read = []; end

quit = 0;
ttlKeyPressed = 0;
key2readPressed = 0;

while ~quit && ~ttlKeyPressed && ~key2readPressed
    [secs, keyCode, ~] = KbPressWait([]);
    keyName = KbName(keyCode);
    if ~isempty(keyName)
        if ~iscell(keyName), keyName = {keyName}; end
        quit = any(contains(lower(keyName), 'esc'));
        ttlKeyPressed = any(contains(keyName, '5'));
        if ~isempty(keys2read)
            key2readPressed = any(contains(lower(keyName), lower(keys2read)));
        end
    end
end

end
