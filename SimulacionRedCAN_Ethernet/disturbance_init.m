function disturbance_init

% Initialize TrueTime kernel
ttInitKernel('prioFP');  % scheduling policy - fixed priority

% Periodic disturbance task
starttime = 0.0;
    % 40 ms
data.T=0.04;

ttCreateTask('disturbance_task', starttime, data.T, 'disturbance_code',data);
ttCreateJob('disturbance_task',1)

