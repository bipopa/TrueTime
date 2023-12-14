function [exectime, data] = controller_codePTAP(seg, data)
data.TimerSaturado=0;
data.TimerSaturadont=1;
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
  ttAnalogOut(data.B1Chan, data.u)  % Output control signal
  if (data.u == data.saturation_max)
      data.TimerSaturadont=0;
      if (data.TimerSaturado == 0)
       data.TimerSaturado=1;
       ttCreateTimer('B2Help', 20, 'EncenderBomba');
       ttRemoveTimer('B1Suficient');
      end
  else
      data.TimerSaturado=0;
      ttRemoveTimer('B2Help');
      if (data.TimerSaturadont==0)
      data.TimerSaturadont=1;
      ttCreateTimer('B1Suficient', 20, 'ApagarBomba');
      end
  end
  exectime=0.000004;
 case 3
  exectime = -1;
end
end

