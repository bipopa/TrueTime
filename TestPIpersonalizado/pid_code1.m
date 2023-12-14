function [exectime, data] = pid_code1(seg, data)
switch seg
 case 1
  r = ttAnalogIn(data.rChan); % Read reference
  y = ttAnalogIn(data.yChan); % Read process output
  data = pidcalcK(data, r, y); % Calculate PID action
  exectime = 0.01;
 case 2
  ttAnalogOut(data.uChan, data.u)  % Output control signal
  exectime = -1;
end
