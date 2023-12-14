function [exectime, data] = plc_event(seg, data)
switch seg
 case 1
  data.u = ttTryFetch('ControlOut');  % Lee el mensaje de controlOut
  exectime = 0.0001; % tiempo de lecutra de la variable double en controlOUT
 case 2
  ttAnalogOut(data.uChan, data.u)  % Output control signal
  exectime = -1;
  
%% a futuro debe agregarse los sistemas de seguridad
%% definidos para el manejo del altivar  
end

