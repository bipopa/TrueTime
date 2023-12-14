function [exectime, data] = controller_rcv(seg, data)
    msg= ttGetMsg;   
    prio=msg.priority;
    y=msg.data;
    if prio == 1
        sensor=y;
        ttTryPost('sensor', sensor); 
        ttCreateJob('datos');
        %ttAnalogOut(data.uChan, data.u);
        ttCreateJob('controller_PID')
    elseif prio == 2
        ttTryPost('referencia', y); 
        ttCreateJob('set_Reference');
    else
        ttAnalogOut(data.uChan, 10);
        % Otro manejo de mensajes según la prioridad
    end
    
    exectime = -1; % Finalizar la ejecución del manejador
end
