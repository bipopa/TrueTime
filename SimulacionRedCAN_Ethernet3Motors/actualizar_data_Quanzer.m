function [exectime, data] = actualizar_data_Quanzer(seg, data)


switch seg
 case 1
  
 %% intenta obtener los datos de sensor y referencia
 
  temp = ttTryFetch('sensor');
  %
  if isempty(temp)
  else
    data.sensorQuanzer=temp;
    ttTryPost('QuanzerState',temp);
    %ttAnalogOut(data.uChan, temp);
  end
  exectime = 0.0001;
 case 2
  exectime = -1;
end
end
