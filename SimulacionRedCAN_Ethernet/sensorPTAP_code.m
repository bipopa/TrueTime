function [exectime, data] = sensorPTAP_code(seg,data)
persistent sense;
switch seg
  
  case 1 
    sense = ttAnalogIn(1);
  
    exectime = 0.00004;
  case 2
    msg.msg = sense;
    msg.type = 'sensor';
    %msg.destination = [1 3];    % final destination = controller
    ttSendMsg(2, msg, 512);
    ttSendMsg(3, msg, 512);
    %ttsendMsg(2,msg,60);
    exectime = -1;
end
