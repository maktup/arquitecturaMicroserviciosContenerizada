@ECHO OFF

REM *********************************************************************
REM * - DESCRIPCION: Shell para la ejecucion de SCRIPTs KUBERNETES JAVA *
REM * - EJECUCION:   SHELL    								            *
REM * - AUTOR:       Cesar Ricardo Guerra Arnaiz   		  	 	        *
REM * - FECHA:       21/01/2020				      				        *
REM * - VERSION:     1.0									            *
REM *********************************************************************

SET vFECHA=%DATE%
SET vHORA=%TIME%

SET vFECHA_ACTUAL=%vFECHA% [%vHORA%]
SET vTRANSACCION=%vFECHA_ACTUAL% - [INFO]: 

SET vRUTA_FILE_SYSTEM=D:\R_GIT\CAPA\GITHUB\Microservicios\arquitecturaMicroserviciosContenerizada\1_scripts\
                 

ECHO. 
@ECHO %vTRANSACCION% -------------------- [INICIO] - [ELIMINACION 'OBJETOS KUBERNETES'] --------------------
ECHO.


@ECHO %vTRANSACCION% -- DESINSTALANDO SCRIPs [GENERICS]:  
kubectl delete -f "%vRUTA_FILE_SYSTEM%0_generic_[Ingress].yml"
kubectl delete -f "%vRUTA_FILE_SYSTEM%0_generic_[Seguridad_Rol].yml"
ECHO.
@ECHO %vTRANSACCION% -- DESINSTALANDO SCRIPs [BOOT-ADMIN-SERVER]:  
kubectl delete -f "%vRUTA_FILE_SYSTEM%1_boot-admin-server_[Secret].yml"
kubectl delete -f "%vRUTA_FILE_SYSTEM%2_boot-admin-server_[Deployment-Service].yml"
ECHO.
@ECHO %vTRANSACCION% -- DESINSTALANDO SCRIPs [EMPLOYEE-SERVICE]:  
kubectl delete -f "%vRUTA_FILE_SYSTEM%1_employee-service_[ConfigMap-Secret].yml"
kubectl delete -f "%vRUTA_FILE_SYSTEM%2_employee-service_[Deployment-Service].yml"  
ECHO.
@ECHO %vTRANSACCION% -- DESINSTALANDO SCRIPs [DEPARTMENT-SERVICE]:   
kubectl delete -f "%vRUTA_FILE_SYSTEM%1_department-service_[ConfigMap-Secret].yml"
kubectl delete -f "%vRUTA_FILE_SYSTEM%2_department-service_[Deployment-Service].yml"  
ECHO.
@ECHO %vTRANSACCION% -- DESINSTALANDO SCRIPs [ORGANIZATION-SERVICE]: 
kubectl delete -f "%vRUTA_FILE_SYSTEM%1_organization-service_[ConfigMap-Secret].yml"
kubectl delete -f "%vRUTA_FILE_SYSTEM%2_organization-service_[Deployment-Service].yml"  
ECHO. 
@ECHO %vTRANSACCION% -- DESINSTALANDO SCRIPs [UTL-CAPADB]: 
kubectl delete -f "%vRUTA_FILE_SYSTEM%1_utl-capadb-service_[ConfigMap-Secret].yml"
kubectl delete -f "%vRUTA_FILE_SYSTEM%2_utl-capadb-service_[Deployment-Service].yml"
kubectl delete -f "%vRUTA_FILE_SYSTEM%3_utl-capadb-service_[Endpoint-Service].yml"
ECHO.
@ECHO %vTRANSACCION% -- DESINSTALANDO SCRIPs [OTHERs: 'GRAFANA-JAEGER-PROMETHEUS-ZIPKIN-STACK']:  
kubectl delete -f "%vRUTA_FILE_SYSTEM%1_grafana-server_[Deployment-Service].yml"
kubectl delete -f "%vRUTA_FILE_SYSTEM%1_jaeger-server_[Deployment-Service].yml"
kubectl delete -f "%vRUTA_FILE_SYSTEM%1_prometheus-server_[ConfigMap-Deployment-Service].yml"
kubectl delete -f "%vRUTA_FILE_SYSTEM%1_zipkin-server_[Deployment-Service].yml"
kubectl delete -f "%vRUTA_FILE_SYSTEM%1_stack_[Filebeat-ConfigMap-DaemonSet-ClusterRoleBinding-ClusterRole-ServiceAccount].yml"
kubectl delete -f "%vRUTA_FILE_SYSTEM%1_stack_[Logstash-Endpoint-Service].yml"
ECHO.
@ECHO %vTRANSACCION% -- DESINSTALANDO SCRIPs [VOLUMENES]:
kubectl delete -f "%vRUTA_FILE_SYSTEM%0_generic_[PersistentVolumeClaim].yml" 


ECHO.
@ECHO %vTRANSACCION% --------------------------------------- [FIN] ---------------------------------------

ECHO Pulsar para cerrar ....
PAUSE

EXIT

