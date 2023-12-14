function [exectime, data] = lectura_sensor(seg, data)

switch seg
 case 1
  r=ttAnalogIn(data.rchan);
  y=ttAnalogIn(data.ychan);
  data.msg.msg = [y,r];
  exectime = 0.0005;
 case 2
  data.msg.type = 'sensor_reference_signal';
  ttSendMsg(2, data.msg, 500); % Send message (80 bits) to node 2 (controller)
  exectime = 0.0004;
 case 3
  exectime = -1; % finished
end
