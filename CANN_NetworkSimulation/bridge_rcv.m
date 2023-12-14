function [exectime, data] = bridge_rcv(seg, data)
msg= ttGetMsg;   
prio=msg.priority;
sensor=msg.data;
%ttAnalogOut(data.uChan, sensor);
if prio == 1
  ttTryPost('sensor', sensor);
  ttCreateJob('saveSensor');
 %ttAnalogOut(data.uChan, sensor);
  %ttCreateJob('set_Reference');
end

exectime = -1;

