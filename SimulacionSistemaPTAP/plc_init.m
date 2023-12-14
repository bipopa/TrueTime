
function plc_init

% Inicializa el kernel de TrueTime con prioridades de punto flotante.
ttInitKernel('prioFP');

% Define los atributos de la tarea.
%starttime = 0.0;  % Tiempo de inicio de la tarea.
%period = 1;   % Período de ejecución de la tarea. Esto dice cada cuanto se ejecuta la tarea
%Periodo indica cada cuanto se debe ejecutar la tarea. el cada segundo


data.saturation_min=0; %saturación minima.
data.saturation_max=10; %saturación maxima.
data.rChan = 1;  % Canal de comunicación de referencia.
data.uChan = 1;  % Canal de comunicación de señal de control.
data.t = 0;      % Marcador de tiempo interno.

% Crear un buzón para el evento que activará la tarea
ttCreateMailbox('consigna', 10);

% IMPLEMENTACIÓN: Cambiar a la ejecución por evento de buzón.
ttCreateHandler('mailbox_handler', 1, 'plc_code', data); % Asocia el manejador a la tarea 'plc_code' con prioridad 1
ttAttachNetworkHandler('mailbox_handler'); % Adjunta el manejador a la red para estar pendiente de los mensajes

% IMPLEMENTACIÓN: Usa el soporte incorporado para tareas periódicas.
% ttCreatePeriodicTask('pid_task', starttime, period, 'plc_code', data);


end