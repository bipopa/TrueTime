function controller_init
ttInitKernel('prioFP');  % scheduling policy - fixed priority
%% Parametros del controlador
% Crea una estructura de datos que almacenar� los par�metros y estados del controlador PID.
data.K = 4.097;   % Ganancia proporcional.
%data.K = 0.119;   % Ganancia proporcional.
data.Ki = 7.978; %ganancia Integral
%data.Ki = 0.011361; %ganancia Integral
data.Kd = 0; % ganancia derivatica
data.u = 0;      % Se�al de control.
data.Iold = 0;   % Estado anterior de la integral.
data.Dold = 0;   % Estado anterior del derivativo.
data.yold = 0;   % Salida anterior del sistema.
data.eold = 0;   % Error Anterior.
data.ref=4;  % referencia
data.T=0.05;  %tiempo de muestreo
data.saturation_min=0; %saturaci�n minima Hz.
data.saturation_max=5; %saturaci�n maxima Hz.
data.uChan = 1;  % Canal de comunicaci�n de se�al de control.
data.t = 0;      % Marcador de tiempo interno.
%% ttFunctions
% Initialize TrueTime kernel
deadline = 10.0;
ttCreateMailbox('sensor', 10);
ttCreateMailbox('referencia', 10);
ttCreateTask('controller_recieve', deadline, 'controller_rcv',data);
ttCreateTask('datos', 1000, 'data_func');
ttCreateTask('controller_PID', deadline, 'controller_code',data);
ttCreateTask('set_Reference', deadline, 'controller_setReference',data);
% Network handler
ttAttachNetworkHandler('controller_recieve')
