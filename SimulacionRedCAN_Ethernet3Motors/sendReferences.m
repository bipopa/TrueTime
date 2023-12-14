function [exectime, data] = sendReferences(seg, data)


refQuanzer= ttTryFetch('referenciaQuanzer'); % tiempo de lecutra de la variable double en controlOUT
refPTAP= ttTryFetch('referenciaPTAP');
refQ.data = refQuanzer;
refQ.priority=2;
refP.msg = refPTAP;
refP.type='referencia';
ttSendMsg([1 2], refQ, 60,2); % Send reference CAN
ttSendMsg([2 2], refP, 512); % Send reference Ethernet
exectime = -1;
  
%% a futuro debe agregarse los sistemas de seguridad
%% definidos para el manejo del altivar  
end


