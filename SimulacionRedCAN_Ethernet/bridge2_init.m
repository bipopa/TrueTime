function bridge_init
% Initialize TrueTime kernel
%% PC-Bridge
ttInitKernel('prioFP');  % scheduling policy - fixed priority
ttCreateMailbox('sensor', 1);
ttCreateMailbox('referencia',10);
ttCreateMailbox('comandos',10);
ttCreateMailbox('referenciaQuanzer',10);
ttCreateMailbox('QuanzerState',10);
%ttCreateMailbox('referenciaPTAP', 10);
%ttCreateMailbox('referenciaQuanzer', 10);
data.refQuanzerchan = 1;

data.uChan=1;
%data.refPTAPchan=2;
data.sensorQuanzer=0;
%data.sensorPTAP=0;
data.OutQuanzerchan=0;
%data.OutPTAP=0;

offset = 1;
periodref = 0.1;
prio = 1;
ttCreatePeriodicTask('setReferences', 0, periodref, 'lectura_Referencia', data);
ttSetPriority(prio, 'setReferences');
ttCreateTask('Out_Quanzer', 10, 'out_display',data);
ttCreatePeriodicTask('DisplaySensor', offset, 0.05, 'display_quanzer', data);
ttSetPriority(2, 'DisplaySensor');
%% Red CAN
deadline = 10.0;
ttCreateTask('bridge_recieve', deadline, 'bridge_rcv');
ttCreateTask('SendReference', 100, 'sendReferenceCAN',data);
%ttCreateTask('set_Reference', deadline, 'controller_setReference');
ttCreateTask('LeerSensorQuanzer', deadline, 'leer_quanzer');
ttCreateTask('saveSensor', 100, 'actualizar_data_Quanzer',data);
% Network handler
ttAttachNetworkHandler(2,'bridge_recieve')
%ttAttachNetworkHandler(2,'bridge_recieve')