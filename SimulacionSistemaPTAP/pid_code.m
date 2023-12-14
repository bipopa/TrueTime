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
  msg = data.u;
  %data.msg.type = 'ControlOut';
  ttTryPost('ControlOut', msg); 
  ttCreateJob('PLC_task');
  exectime=0.000043;
 case 3
 %% coloca el valor de control en la salida
  %data.msg.msg = data.u;
  %data.msg.type = 'ControlOut';
  %ttTryPost('ControlOut', msg); 
  %ttCreateJob('PLC_task');
  %ttAnalogOut(data.uChan, data.u)  % Output control signal
  exectime = -1;
end
end

