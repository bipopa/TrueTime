function PI_Sensor_init

% Distributed control system: actuator node
%
% Initialize TrueTime kernel
ttInitKernel('prioFP'); % fixed priority
ttSetKernelParameter('energyconsumption', 0.010); % 10 mW

% Create mailboxes
ttCreateMailbox('power_ping', 10)
ttCreateMailbox('power_response', 10)

% Create sensor task
data.ychan = 1;
data.rchan=2;
offset = 0.0;
period = 0.8;
prio = 1;
ttCreatePeriodicTask('sens_task', offset, period, 'lectura_sensor', data);
ttSetPriority(prio, 'sens_task');

% Create actuator task
deadline = 100;
prio = 2;
ttCreateTask('act_task', deadline, 'actcode');
ttSetPriority(prio, 'act_task');


%% VERIFICaR que TODO EL CODIGO corresponda al diagrama
%% AGREGAR NODO PLC
% Create power controller task
offset = 2.07;
period = 0.025;
prio = 3;
power_data.transmitPower = 20;
power_data.name = 1;     % We are node number 1 in the network
power_data.receiver = 2; % We are communicating with node 2
power_data.haverun = 0;  % We have not run yet
ttCreatePeriodicTask('power_controller_task', offset, period, 'powctrlcode', power_data);
ttSetPriority(prio, 'power_controller_task');

% Create power response task
deadline = 100;
prio = 4;
ttCreateTask('power_response_task', deadline, 'powrespcode');
ttSetPriority(prio, 'power_response_task');

% Initialize network
ttCreateHandler('nw_handler', 1, 'msgRcvSensor');
ttAttachNetworkHandler('nw_handler');
