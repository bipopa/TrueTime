function [exectime, data] = sendReferenceCAN(seg, data)
persistent r;
switch seg
 case 1
   r= ttTryFetch('referenciaQuanzer');
   ttTryPost('referencia', r); % Lee el mensaje de controlOut
  exectime = 0.0001; % tiempo de lecutra de la variable double en controlOUT
 case 2
 msg.data = r;
 msg.priority=2;
 ttSendMsg(2, msg, 60,2); % Send message (80 bits) to node 3 (controller)
  exectime = -1;
  
%% a futuro debe agregarse los sistemas de seguridad
%% definidos para el manejo del altivar  
end


