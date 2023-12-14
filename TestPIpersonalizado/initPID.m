
function initPID(mode)
% Esta función inicializa un controlador PID para un sistema de servomecanismo de corriente continua (DC servo).

% Inicializa el kernel de TrueTime con prioridades de punto flotante.
ttInitKernel('prioFP');

% Define los atributos de la tarea.
starttime = 0.0;  % Tiempo de inicio de la tarea.
period = 1;   % Período de ejecución de la tarea. Esto dice cada cuanto se ejecuta la tarea
%Periodo indica cada cuanto se debe ejecutar la tarea. el cada segundo
%ejecuta pid_code4
deadline = period;  % Fecha límite para la tarea.

% Crea una estructura de datos que almacenará los parámetros y estados del controlador PID.
data.K = 0.119;   % Ganancia proporcional.
data.Ti = 0.12;  % Tiempo integral.
data.Ki = 0.011361; %ganancia Integral
data.Td = 0.049; % Tiempo derivativo.
data.Kd = 0; % ganancia derivatica
data.beta = 0.5;  % Factor de anticipación.
data.N = 10;     % Número de filtros de derivación.
data.h = period; % Paso de tiempo.
data.u = 0;      % Señal de control.
data.Iold = 0;   % Estado anterior de la integral.
data.Dold = 0;   % Estado anterior del derivativo.
data.yold = 0;   % Salida anterior del sistema.
data.eold = 0;   % Error Anterior.
data.saturation_min=0; %saturación minima.
data.saturation_max=10; %saturación maxima.
data.rChan = 1;  % Canal de comunicación de referencia.
data.yChan = 2;  % Canal de comunicación de salida.
data.uChan = 1;  % Canal de comunicación de señal de control.
data.t = 0;      % Marcador de tiempo interno.

switch mode
    case 1
        % IMPLEMENTACIÓN 1: Usa el soporte incorporado para tareas periódicas.
        ttCreatePeriodicTask('pid_task', starttime, period, 'pid_code1', data);

    case 2 
        % IMPLEMENTACIÓN 2: Llama a un bloque de Simulink dentro de la función de código.
        data2.u = 0;  % Solo la señal de control necesita ser almacenada entre segmentos.
                      % Los estados del controlador son almacenados internamente por TrueTime.
        ttCreatePeriodicTask('pid_task', starttime, period, 'pid_code2', data2);

    case 3 
        % IMPLEMENTACIÓN 3: Utiliza sleepUntil y bucle de regreso en el código de la tarea.
        ttCreateTask('pid_task', deadline, 'pid_code3', data);
        ttCreateJob('pid_task');

    case 4 
        % IMPLEMENTACIÓN 4: Muestreo en el manejador de temporizador, desencadena la tarea.
        % Muestras comunicadas a través de un buzón.
        prio = 1;
        hdl_data.yChan = 2;
        ttCreateHandler('timer_handler', prio, 'sampler_code', hdl_data);
        ttCreatePeriodicTimer('mytimer', 0, period, 'timer_handler');
        ttCreateMailbox('Samples', 10);
        ttCreateTask('pid_task', deadline, 'pid_code4', data);
end