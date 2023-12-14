 function data = pidcalcK(data, r, y)
e=r-y;
P = data.K*(e);
I = antiwindup_function(data.Iold, data.K, data.Ti, r - y, data.saturation_min, data.saturation_max); 
D =data.Kd*(e-data.eold); 
data.eold = e;
data.u = funcion_saturacion(P, I, D, data.saturation_min, data.saturation_max);
data.Iold = I;
data.Dold = D;
data.yold = y;

end
%antinwindup para integrador
function antiwindup = antiwindup_function(I, Ki, Ti, error, saturation_min, saturation_max)
    antiwindup = I + Ki * Ti * error;

    % Limitar el anti-windup dentro de los límites de saturación
    if antiwindup > saturation_max
        antiwindup = saturation_max;
    elseif antiwindup < saturation_min
        antiwindup = saturation_min;
    end
end
%Saturacion
function salida =funcion_saturacion(P, I, D, saturation_min, saturation_max)
     salida = P+I+D;

    % Limitar el anti-windup dentro de los límites de saturación
    if salida > saturation_max
        salida = saturation_max;
    elseif salida < saturation_min
        salida = saturation_min;
    end
end
