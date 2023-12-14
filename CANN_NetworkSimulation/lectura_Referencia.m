function [exectime, data] = lectura_Referencia(seg, data)
persistent r
switch seg
 case 1
  r=ttAnalogIn(data.refQuanzerchan);
  %y=ttAnalogIn(data.ychan);
  %data.msg.msg = [y,r];
  data.msg.msg=r;
  exectime = 0.00001;
 case 2
  %data.msg.type = 'ControlOut';
  ttTryPost('referenciaQuanzer', r); 
  ttCreateJob('SendReference');
  %data.msg.type = 'referencia';
  %ttSendMsg(2, data.msg, 16,2); % Send message (500 bits) to node 2 (controller)
  exectime = 0.000023;
 case 3
  exectime = -1; % finished
end
