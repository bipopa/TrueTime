function [exectime, data] = pid_code(seg, data)


switch seg
 case 1
 %% intenta obtener los datos de sensor y referencia
  temp = ttTryFetch('sensor_reference_signal');
  while ~isempty(temp)
    y = temp(1);
    r = temp(2);
    temp = ttTryFetch('sensor_reference_signal');  
  end

  data = calculoPID(data, r, y); % Calculate PID action
  exectime = 0.01;
 case 2
 %% coloca el valor de control en la salida
  ttAnalogOut(data.uChan, data.u)  % Output control signal
  exectime = -1;
end
end

