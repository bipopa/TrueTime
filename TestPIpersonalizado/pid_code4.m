function [exectime, data] = pid_code4(seg, data)
switch seg
 case 1
  r = ttAnalogIn(data.rChan); % Read reference
  y = ttTryFetch('Samples');  % Read sample from mailbox
  data = pidcalcK(data, r, y); % Calculate PID action
  exectime = 0.01;  % este es el tiempo de ejecucion de la tarea, en este caso el tiempo que se demora en realziar los calculo y poner la salida
 case 2
  ttAnalogOut(data.uChan, data.u)  % Output control signal
  exectime = -1;
end
