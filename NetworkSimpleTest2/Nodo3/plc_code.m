function [exectime, data] = plc_code(seg, data)
switch seg
 case 1
  data.u = ttAnalogIn(data.rChan); % Read reference
  exectime = 0.01;
 case 2
  ttAnalogOut(data.uChan, data.u)  % Output control signal
  exectime = -1;
  
%% a futuro debe agregarse los sistemas de seguridad
%% definidos para el manejo del altivar  
end

