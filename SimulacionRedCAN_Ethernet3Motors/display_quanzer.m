function [exectime, data] = display_Quanzer(seg, data)

switch seg
 case 1
  msg='s';
  ttTryPost('comandos', msg); 
  ttCreateJob('LeerSensorQuanzer');
  %data2=ttGetData('saveSensor');

  exectime = 0.000005;
 case 2
  exectime = -1; % finished
end
