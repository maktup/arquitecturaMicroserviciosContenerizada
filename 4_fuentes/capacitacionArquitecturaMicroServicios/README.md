
IMPORTANTE:
----------
* Proyecto PRINCIPAL que permite la 'COMPILACION & EMPAQUETAMIENTO & EJECUCION' de TODOS los proyectos (MODULOS) que forman parte del DUMMY de 'ARQUITECTURA de MICROSERVICIOS'
  CONTENERIZADO con KUBERNETES manejado. 

* Se debe de ACTIVAR en KUBERNETES lo siguiente:

  A. PLUGINs:
     Agregando y desagregando ADDONs en 'MINIKUBE': 
 
     minikube addons list
   
     minikube addons enable ingress 
     minikube addons enable ingress-dns
     minikube addons enable logviewer
     minikube addons enable metrics-server
  
     minikube addons disable ingress 
     minikube addons disable ingress-dns
     minikube addons disable logviewer
     minikube addons disable metrics-server
    
  B. DOCKER:   
	 minikube docker-env
	   
	 se muestra:
	 SET DOCKER_TLS_VERIFY=1
	 SET DOCKER_HOST=tcp://192.168.137.84:2376
	 SET DOCKER_CERT_PATH=C:\Users\cesar\.minikube\certs
	 REM Run this command to configure your shell:
	 REM @FOR /f "tokens=*" %i IN ('minikube docker-env') DO @%i
	   
	 Ejecutar:
	 @FOR /f "tokens=*" %i IN ('minikube docker-env') DO @%i


* NEXUS2:
  ------ 
  Se debe levantar la plataforma del 'NEXUS':
  
  cd C:\JAVA\NEXUS\nexus-3.15.2-01\bin  
  nexus console


* El ORDEN de MODULOS que se debe manejar para el DESPLIEGUE (SCRIPTs) respectivo CORRECTO debe ser el siguiente:

  1. boot-admin-server
  2. utl-capadb
  3. employee-service
  4. department-service
  5. organization-service



'DNS' A CONFIGURAR EN EL ARCHIVO 'HOST':
-------------------------------------
Las IPs ahi deberian ser manejadas como FIJAS, sino 'ACTUALIZARLAS' constantemente a nivel de HOST.


#------ [CONFIGURACION 'ARQUITECTURA-CONTENERIZADA' ('KUBERNETES' - INGRESS)] ------#
#-- 'IP de KUBERNETES':
192.168.99.100  capacitacion.microservicios.employee
192.168.99.100  capacitacion.microservicios.department
192.168.99.100  capacitacion.microservicios.organization
192.168.99.100  capacitacion.microservicios.utlcapadb
192.168.99.100  capacitacion.microservicios.boot-admin-server
192.168.99.100  capacitacion.microservicios.zipkin-server
192.168.99.100  capacitacion.microservicios.grafana-server
192.168.99.100  capacitacion.microservicios.prometheus-server
192.168.99.100  capacitacion.microservicios.jaeger-server
192.168.99.100  capacitacion.microservicios.jaeger-server-view
#------ [CONFIGURACION 'ARQUITECTURA-CONTENERIZADA' ('KUBERNETES' - INGRESS)] ------#


#------------------ [CONFIGURACION 'GENERICOS'] ------------------#
127.0.0.1  capacitacion.microservicios.logstash
127.0.0.1  capacitacion.microservicios.elasticsearch
127.0.0.1  capacitacion.microservicios.kibana
#------------------ [CONFIGURACION 'GENERICOS'] ------------------#



INSTALACION / DESINSTALACION (SERVICIOS):
----------------------------------------
Para la INSTACION/DESINSTALACION en 'WINDOWS' se debe ejecutar los siquientes SCRIPTs. 

- CREATE_Objects_Kubernetes.bat 
- DELETE_Objects_Kubernetes.bat

Para la INSTACION/DESINSTALACION en 'LINUX' se debe ejecutar los siquientes SCRIPTs. 

- sh ./CREATE_Objects_Kubernetes.sh 
- sh ./DELETE_Objects_Kubernetes.sh
   
IMPORTANTE: Es bueno saber que luego de ELIMINAR el ambiente completo con los SCRIPTs, se debera ACTUALIZAR lo que son los IPs en el archivo HOST (si las IPs NO son estaticas),
así como las IPs definida los objetos 'ENDPOINT' de KUBERNETES: 

- 1_stack_[Logstash-Endpoits-Service].yml
- 3_utl-capadb-service_[Endpoits-Service].yml


STACK (ELASTICSEARCH):
---------------------
Carga inicial: 

A. ELASTICSEARCH: 
   $ cd D:\ELASTIC_STACK\ELASTICSEARCH\elasticsearch-7.5.2\bin
   $ elasticsearch.bat 

B. KIBANA:
   $ cd D:\ELASTIC_STACK\KIBANA\kibana-7.5.2-windows-x86_64\bin
   $ kibana.bat 

C. LOGSTASH: (Creamos el directorio 'CONFIGURACIONES' & su archivo)
   $ cd D:\ELASTIC_STACK\LOGSTASH\logstash-7.5.2
   $ .\bin\logstash.bat -f .\configuraciones\ETL_CapacitacionMicroservicios_v1.0.conf

D. FILEBEAT: (Configurad: 'filebeat.yml') 
   $ cd D:\ELASTIC_STACK\BEATS\filebeat-7.5.2-windows-x86_64
   $ .\filebeat.exe -c .\filebeat.yml



HERRAMIENTAS (MICROSERVICIOS):
-----------------------------
 0. MICROMETER: Herramienta que sirve de FACHADA SIMPLE como medio para integrar & enviar METRICAS del ACTUATOR (Monitoreo Externo). 
 1. ZIPKIN:     Herramienta que permite obtener mediantes AGENTES la TRAZABILIDAD de las ejecuciones en los MICROSERVICIOS.
 2. JAEGER:     Herramienta similar ZIPKIN.  
 3. PROMETHEUS: Herramienta de MONITORIZACIÓN que brinda una INTERFACE (BÁSICA) en base a las métricas de los MICROSERVICIOS de forma periódica, 
                enviados con el ACTUATOR por el MICROMETER. 
 4. GRAFANA:    Herramienta de MONITORIZACIÓN para MULTRIPLES DATASOURCES (Prometheus, BDs, ElasticSearch, Graphite, Kiali etc), que permite visualizar & 
                generar DASHBOARs así como enviar ALERTAS & REGLAS.  
 5. KIALI:      Herramienta que proporciona métricas detalladas, una integración básica de GRAFANA, está disponible para consultas avanzadas. 
                El rastreo distribuido se proporciona integrando JAEGER

 
HERRAMIENTAS (MICROSERVICIOS) - [DESPLEGADAS]:
--------------------------------------------- 
- BOOT-ADMIN SERVER: http://capacitacion.microservicios.boot-admin-server
- ZIPKIN SERVER:     http://capacitacion.microservicios.zipkin-server
- GRAFANA SERVER:    http://capacitacion.microservicios.grafana-server
- PROMETHEUS SERVER: http://capacitacion.microservicios.prometheus-server
- JAEGER SERVER:     http://capacitacion.microservicios.jaeger-server
 
- ELASTIC SEARCH SERVER: http://capacitacion.microservicios.elasticsearch:9200
- KIBANA SERVER:         http://capacitacion.microservicios.kibana:5601
- LOGSTASH SERVER:       http://capacitacion.microservicios.logstash:9600
 

----------------------------------------------------------------------------------------------------------------------------------------------------------------- 
 
REPOSITORIOS (GITHUB):
---------------------

ARQUITECTURA [CLASICA]:
----------------------
https://github.com/maktup/arquitecturaMicroserviciosClasica.git
https://github.com/maktup/arquitecturaMicroserviciosClasica-properties.git


ARQUITECTURA [CONTENERIZADA]:
----------------------------
https://github.com/maktup/arquitecturaMicroserviciosContenerizada.git

https://github.com/maktup/utl-capadb.git
https://github.com/maktup/employee-service.git
https://github.com/maktup/department-service.git 
https://github.com/maktup/organization-service.git
https://github.com/maktup/boot-admin-server.git
 
 