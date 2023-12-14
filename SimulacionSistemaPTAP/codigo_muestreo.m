function [exectime, data] = codigo_muestreo(seg, data)

switch seg
 %% intenta leer los datos del sensor   
 case 1
  % Read all buffered packets
  temp1 = ttTryFetch('sensor_signal');
  temp2 = ttTryFetch('reference_signal');
  while ~isempty(temp1)
    y = temp1;
    temp1 = ttTryFetch('sensor_signal');
    
  end
  ttTryPost('Samples', y);
  while ~isempty(temp2)
    r = temp2;
    temp2 = ttTryFetch('reference_signal');
  end
   ttTryPost('referencia', r);

 case 2
 %% ejecuta el codigo de control 
  ttCreateJob('pid_task')     % Trigger task job
  exectime = -1;
end