

IMPORTANTE:
----------
Proyecto PRINCIPAL que permite la 'COMPILACION & EMPAQUETAMIENTO & EJECUCION' de TODOS los proyectos (MODULOS) que forman parte del DUMMY de 'ARQUITECTURA de MICROSERVICIOS'
CONTENERIZADO con KUBERNETES manejado. 


El ORDEN de MODULOS que se debe manejar para el DESPLIEGUE (SCRIPTs) respectivo CORRECTO debe ser el siguiente:

1. boot-admin-server
2. utl-capadb
3. employee-service
4. department-service
5. organization-service



'DNS' A CONFIGURAR EN EL ARCHIVO 'HOST':
-------------------------------------
Las IPs ahi deberian ser manejadas como FIJAS, sino ACTUALIZARLAS constantemente.


#------ [CONFIGURACION 'ARQUITECTURA-CONTENERIZADA' ('KUBERNETES' - INGRESS)] ------#
#-- 'IP de KUBERNETES':
192.168.99.102  capacitacion.microservicios.employee
192.168.99.102  capacitacion.microservicios.department
192.168.99.102  capacitacion.microservicios.organization
192.168.99.102  capacitacion.microservicios.utlcapadb
192.168.99.102  capacitacion.microservicios.boot-admin-server
192.168.99.102  capacitacion.microservicios.zipkin-server
192.168.99.102  capacitacion.microservicios.grafana-server
192.168.99.102  capacitacion.microservicios.prometheus-server
192.168.99.102  capacitacion.microservicios.jaeger-server
192.168.99.102  capacitacion.microservicios.jaeger-server-view
192.168.99.102  capacitacion.microservicios.logviewer-server
#------ [CONFIGURACION 'ARQUITECTURA-CONTENERIZADA' ('KUBERNETES' - INGRESS)] ------#


#------------------ [CONFIGURACION 'GENERICOS'] ------------------#
127.0.0.1  capacitacion.microservicios.logstash
127.0.0.1  capacitacion.microservicios.elasticsearch
#------------------ [CONFIGURACION 'GENERICOS'] ------------------#



INSTALACION / DESINSTALACION:
----------------------------
Para la INSTACION/DESINSTALACION en WINDOWS se debe ejecutar los siquientes SCRIPTs. 

- CREATE_Objects_Kubernetes.bat 
- DELETE_Objects_Kubernetes.bat

Para la INSTACION/DESINSTALACION en LINUX se debe ejecutar los siquientes SCRIPTs. 

- sh ./CREATE_Objects_Kubernetes.sh 
- sh ./DELETE_Objects_Kubernetes.sh
   
IMPORTANTE: Es bueno saber que luego de ELIMINAR el ambiente completo con los SCRIPTs, se debera ACTUALIZAR lo que son los IPs en el archivo HOST (si las IPs NO son estaticas),
así como la IP definida en objeto 'ENDPOINT' en los archivos: 

- 1_stack_[Logstash-Endpoits-Service].yml
- 3_utl-capadb-service_[Endpoits-Service].yml


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


 