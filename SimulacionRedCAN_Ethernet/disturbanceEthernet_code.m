function [exectime, data] = disturbanceEthernet_code(seg,data)
switch seg
    case 1
%networkNbr = floor(rand*3) + 1;  % select a random network (1-3)
    msg = [];                         % empty message
    ttSendMsg(4, msg, 10000000);  % send high prio msg to itself

    exectime = data.T*rand;
    ttSetNextSegment(1);
    case 2
    exectime=-1;
end
end

