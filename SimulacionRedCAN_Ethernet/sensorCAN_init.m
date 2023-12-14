function sensor_init

% outputs periodic traffic to esc

% Initialize TrueTime kernel
ttInitKernel('prioFP');  % scheduling policy - fixed priority

% Periodic sensor task
starttime = 0.0;
period = 0.05;     % 50 ms

ttCreatePeriodicTask('sensor_task', starttime, period, 'sensorCAN_code');

