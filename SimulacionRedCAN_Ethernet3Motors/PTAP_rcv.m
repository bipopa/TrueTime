function [exectime, data] = PTAP_rcv(seg, data)
    
switch seg
    case 1
    temp = ttGetMsg(2);
    %ttTryPost(temp.type, temp.msg);% indica a que mailbox y que mensaje se envia    
    type=temp.type;
    sense=temp.msg;
    if strcmp('sensor',type)
        ttAnalogOut(data.OutPTAP, sense);
    end
    exectime=0.00004;
    case 2
    exectime = -1; % Finalizar la ejecución del manejador
end
