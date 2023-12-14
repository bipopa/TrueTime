function [exectime, data] = out_display(seg, data)


switch seg
 case 1
 %% intenta obtener los datos de sensor y referencia
  temp = ttTryFetch('QuanzerState');  
  if isempty(temp)
  else
  ttAnalogOut(data.OutQuanzerchan, temp);
  end
  exectime = 0.00001;
 case 2
  exectime = -1;
end
end
