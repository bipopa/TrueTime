function [exectime, data] = controllerPTAP_rcv(seg, data)

switch seg
    case 1
    temp = ttGetMsg;
    %ttTryPost(temp.type, temp.msg);% indica a que mailbox y que mensaje se envia    
    type=temp.type
    msg=temp.msg
    
    if strcmp('sensor',type)
        ttTryPost('sensor', msg);% indica a que mailbox y que mensaje se envia  
        ttCreateJob('controller_PID');
    elseif strcmp('referencia',type)
        ttTryPost('referencia', msg);
        ttCreateJob('set_ReferencePTAP');
    end
    
    exectime=0.00001;
    case 2
    exectime = -1; % Finalizar la ejecución del manejador
end
