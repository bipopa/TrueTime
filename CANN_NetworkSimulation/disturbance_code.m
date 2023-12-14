function [exectime, data] = disturbance_code(seg,data)

%networkNbr = floor(rand*3) + 1;  % select a random network (1-3)
msg = [];                        % empty message
priority = 3;                    % highest priority

ttSendMsg(4, msg, 64, priority);  % send high prio msg to itself

exectime = 0.001+0.001*rand;
ttSetNextSegment(1);
