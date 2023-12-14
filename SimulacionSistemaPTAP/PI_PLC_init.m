function PI_PLC_init

%recibe señal de sensor de nodo1 y envia valor de control al PLC

%% parametros generales
% Initialize TrueTime kernel
ttInitKernel('prioFP'); % fixed priority
ttSetKernelParameter('energyconsumption', 0.010); % 10 mW

% Create mailboxes
ttCreateMailbox('sensor_reference_signal', 10)
ttCreateMailbox('ControlOut', 10)
ttCreateMailbox('power_ping', 10)
ttCreateMailbox('power_response', 10)
%% Parametros del controlador
% Crea una estructura de datos que almacenará los parámetros y estados del controlador PID.
data.K = 0.1847;   % Ganancia proporcional.
%data.K = 0.119;   % Ganancia proporcional.
data.Ki = 0.09932; %ganancia Integral
%data.Ki = 0.011361; %ganancia Integral
data.Kd = 0; % ganancia derivatica
data.u = 0;      % Señal de control.
data.Iold = 0;   % Estado anterior de la integral.
data.Dold = 0;   % Estado anterior del derivativo.
data.yold = 0;   % Salida anterior del sistema.
data.eold = 0;   % Error Anterior.
data.T=0.2;  %tiempo de muestreo
data.saturation_min=0; %saturación minima Hz.
data.saturation_max=60; %saturación maxima Hz.
data.uChan = 1;  % Canal de comunicación de señal de control.
data.t = 0;      % Marcador de tiempo interno.


%% Definición tarea del controlador
% IMPLEMENTACIÓN: Evento de red, desencadena la tarea.

% Muestras comunicadas a través de un buzón.
        % Task attributes
prio = 1;
%period = 1;

deadline = 10.0;
ttCreateTask('pid_task', deadline, 'pid_code', data);
ttSetPriority(prio, 'pid_task');

%% Definición de tarea PLC

ttCreateTask('PLC_task', deadline, 'plc_event', data);


%% Definición PowerControl

% Create power controller task
offset = 3;
period = 0.025;
prio = 2;
power_data.transmitPower = 20;
power_data.name = 2;     % We are node number 2 in the network
power_data.receiver = 1; % We are communicating with node 1
power_data.haverun = 0;  % We have not run yet
ttCreatePeriodicTask('power_controller_task', offset, period, 'powctrlcode', power_data);
ttSetPriority(prio, 'power_controller_task');

% Create power response task
deadline = 100;
prio = 3;
ttCreateTask('power_response_task', deadline, 'powrespcode');
ttSetPriority(prio, 'power_response_task');
%% Definición de red y handler de RED
% Initialize network
ttCreateHandler('nw_handler', 1, 'msgRcvCtrl');
ttAttachNetworkHandler('nw_handler');        
end

