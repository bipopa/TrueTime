function [exectime, data] = sensor_code(seg,data)
persistent sense;
switch seg
  
  case 1 
    sense = ttAnalogIn(1);
    exectime = 0.0004;
  case 2
    %msg.timestamp = ttCurrentTime;
    msg.data = sense;
    msg.priority=1;
    %msg.destination = [1 3];    % final destination = controller
    ttSendMsg(2, msg, 50,1);   
    ttSendMsg(3, msg, 50,1); 
    %ttsendMsg(2,msg,60);
    exectime = -1;
end
