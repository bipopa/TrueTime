function [exectime, data] = PumpRotation(seg, data)
bombaPrincipal=data.BombaMain;
switch bombaPrincipal
 case 1
 data.BombaMain=2;
 data.B1State=0;
 data.B2State=1;
 data.B3State=0;
 case 2
 data.BombaMain=3;
 data.B1State=0;
 data.B2State=1;
 data.B3State=0;
 case 3
 data.BombaMain=1;
 data.B1State=0;
 data.B2State=1;
 data.B3State=0;
end
exectime=-1;
end