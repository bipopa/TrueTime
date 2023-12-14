function controllerPTAP_init
ttInitKernel('prioFP');  % scheduling policy - fixed priority
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
data.ref=0;
data.t = 0;      % Marcador de tiempo interno.
%% ttFunctions
% Initialize TrueTime kernel

ttCreateMailbox('sensor', 10)
ttCreateMailbox('referencia', 10)
ttCreateMailbox('ControlOut', 10)

deadline = 10.0;
ttCreateTask('controllerPTAP_recieve', deadline, 'controllerPTAP_rcv',data);
ttCreateTask('datos', 1000, 'data_func');
ttCreateTask('controller_PID', deadline, 'controller_code',data);
ttCreateTask('set_ReferencePTAP', deadline, 'controller_setReference',data);
% Network handler
ttAttachNetworkHandler('controllerPTAP_recieve')
