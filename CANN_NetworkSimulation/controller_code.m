function [exectime, data] = controller_code(seg, data)
data2 = ttGetData('datos');
switch seg
 case 1
  y = ttTryFetch('sensor');
  ref_msg = ttTryFetch('referencia');
  if isempty(ref_msg)
  else
  data.ref=ref_msg;
  data2.ref=ref_msg;
  ttSetData('datos', data2)
  end
  data = calculoPID(data,y); % Calculate PID action
  
  exectime = 0.0001;
 case 2
  ttAnalogOut(data.uChan, data.u)  % Output control signal
  exectime=0.000004;
 case 3
  exectime = -1;
end
end

