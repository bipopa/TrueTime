function [exectime, data] = controller_setReference(seg, data)
datanew=ttGetData('controller_PID');
y = ttTryFetch('referencia');
datanew.ref=y;
switch seg
 case 1
 %% intenta obtener los datos de sensor y referencia
 ttSetData('controller_PID',datanew);
  exectime = 0.0001;
  
 case 2
  exectime = -1;
end
end

