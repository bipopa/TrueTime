function [exectime, data] = msgRcvSensor(seg, data)

temp = ttGetMsg;
ttTryPost(temp.type, temp.msg);

if strcmp('power_ping', temp.type)
  ttCreateJob('power_response_task');
end

exectime = -1;