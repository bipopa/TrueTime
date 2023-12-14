
function plc_init
% Esta función inicializa un controlador PID para un sistema de servomecanismo de corriente continua (DC servo).

% Inicializa el kernel de TrueTime con prioridades de punto flotante.
ttInitKernel('prioFP');

% Define los atributos de la tarea.
starttime = 0.0;  % Tiempo de inicio de la tarea.
period = 1;   % Período de ejecución de la tarea. Esto dice cada cuanto se ejecuta la tarea
%Periodo indica cada cuanto se debe ejecutar la tarea. el cada segundo


data.saturation_min=0; %saturación minima.
data.saturation_max=10; %saturación maxima.
data.rChan = 1;  % Canal de comunicación de referencia.
data.uChan = 1;  % Canal de comunicación de señal de control.
data.t = 0;      % Marcador de tiempo interno.

% IMPLEMENTACIÓN: Usa el soporte incorporado para tareas periódicas.
  ttCreatePeriodicTask('pid_task', starttime, period, 'plc_code', data);


end