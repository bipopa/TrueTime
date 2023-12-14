function [exectime, data] = data_func(seg, data)

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
exectime=-1;
end
