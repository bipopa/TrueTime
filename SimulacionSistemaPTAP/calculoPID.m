 function data = calculoPID(data, r, y)
e=r-y;
P = data.K*(e);
I = data.Iold + e*data.T;
D =data.Kd*(e-data.eold); 
I = antiwindup_function(data.Iold,P, data.Ki,I, D, data.saturation_min, data.saturation_max); 

%data.u = P+data.Ki*I+D;
data.eold = e;
data.u = funcion_saturacion(P, data.Ki*I, D, data.saturation_min, data.saturation_max);
data.Iold = I;
data.Dold = D;
data.yold = y;

 end

%antinwindup para integrador
function antiwindup = antiwindup_function(Iold, P,Ki,I,D, saturation_min, saturation_max)
    salida = P+Ki*I+D;

    % Limitar el anti-windup dentro de los límites de saturación
    if salida > saturation_max
        antiwindup = Iold;
    elseif salida < saturation_min
        antiwindup = saturation_min;
    else
        antiwindup=I;
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
