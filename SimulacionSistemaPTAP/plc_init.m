
function plc_init

% Inicializa el kernel de TrueTime con prioridades de punto flotante.
ttInitKernel('prioFP');

% Define los atributos de la tarea.
%starttime = 0.0;  % Tiempo de inicio de la tarea.
%period = 1;   % Per�odo de ejecuci�n de la tarea. Esto dice cada cuanto se ejecuta la tarea
%Periodo indica cada cuanto se debe ejecutar la tarea. el cada segundo


data.saturation_min=0; %saturaci�n minima.
data.saturation_max=10; %saturaci�n maxima.
data.rChan = 1;  % Canal de comunicaci�n de referencia.
data.uChan = 1;  % Canal de comunicaci�n de se�al de control.
data.t = 0;      % Marcador de tiempo interno.

% Crear un buz�n para el evento que activar� la tarea
ttCreateMailbox('consigna', 10);

% IMPLEMENTACI�N: Cambiar a la ejecuci�n por evento de buz�n.
ttCreateHandler('mailbox_handler', 1, 'plc_code', data); % Asocia el manejador a la tarea 'plc_code' con prioridad 1
ttAttachNetworkHandler('mailbox_handler'); % Adjunta el manejador a la red para estar pendiente de los mensajes

% IMPLEMENTACI�N: Usa el soporte incorporado para tareas peri�dicas.
% ttCreatePeriodicTask('pid_task', starttime, period, 'plc_code', data);


end