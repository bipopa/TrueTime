function [exectime, data] = disturbance_code(seg,data)

switch seg
    case 1
%networkNbr = floor(rand*3) + 1;  % select a random network (1-3)
msg = [];                        % empty message
priority = 3;                    % highest priority

ttSendMsg(4, msg, 200, priority);  % send high prio msg to itself

exectime = data.T;
ttSetNextSegment(1);
case 2
    exectime=-1;
end
end