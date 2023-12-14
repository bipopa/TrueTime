function [exectime, data] = lectura_Referencia(seg, data)
persistent refQuanzer
persistent refPTAP
switch seg
 case 1
  refQuanzer=ttAnalogIn(data.refQuanzerchan);
  refPTAP=ttAnalogIn(data.refPTAPchan);
  exectime = 0.00004;
 case 2
  %data.msg.type = 'ControlOut';
  ttTryPost('referenciaQuanzer', refQuanzer);
  ttTryPost('referenciaPTAP', refPTAP); 
  ttCreateJob('SendReference');
  exectime = 0.000023;
 case 3
  exectime = -1; % finished
end
