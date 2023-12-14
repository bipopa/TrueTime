function [exectime, data] = controller_codePTAP2(seg, data)
switch seg
 case 1
  y = ttTryFetch('sensor');
  ref_msg = ttTryFetch('referencia');
  if isempty(ref_msg)
  else
  data.ref=ref_msg;
  end
  data = calculoPID(data,y); % Calculate PID action
  exectime = 0.0001;
 case 2
  ttAnalogOut(data.B2Chan, data.u)  % Output control signal
  exectime=0.000004;
 case 3
  exectime = -1;
end
end

