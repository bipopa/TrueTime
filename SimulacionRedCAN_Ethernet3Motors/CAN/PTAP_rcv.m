function [exectime, data] = PTAP_rcv(seg, data)
    temp = ttGetMsg;
    ttTryPost(temp.type, temp.msg);% indica a que mailbox y que mensaje se envia    
    type=temp.type;
    if strcmp('sensor',type)
        
    elseif strcmp('referencia',type)
        ttCreateJob('set_ReferencePTAP');
    end
    
    exectime = -1; % Finalizar la ejecución del manejador
end
