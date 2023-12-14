clc

load workspace.mat
%%
%definición planta de voltaje-presion del agua (velocidad bomba-presion)
kb_p=4.5494;
Tb_p=9.5615;
s=tf('s');
rb_p=5.451;
delay=exp(-rb_p*s);
numbp=[kb_p];
denbp=[Tb_p 1];
sys=tf(numbp,denbp)
sysBombasPresion=sys*delay;
%llamada a planta desde el workspace a la planta
sysMeas = tf(Plant1,'measured') 

Wn=0.72398;
amort=0.69062;

numPLC_ATV=Wn^2;
denPLC_ATV=[1 2*amort*Wn Wn^2];
polos=roots(denPLC_ATV)
sysPLC_ATV=tf(numPLC_ATV,denPLC_ATV)

%modelo PLC_Presion
PlantaTot=sysBombasPresion*sysPLC_ATV
polostot=pole(PlantaTot);
sysMeas = tf(C,'measured')
