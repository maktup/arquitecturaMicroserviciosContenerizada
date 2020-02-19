

IMPORTANTE:
----------
Proyecto PRINCIPAL que permite la 'COMPILACION & EMPAQUETAMIENTO & EJECUCION' de TODOS los proyectos (MODULOS) que forman parte del DUMMY de 'ARQUITECTURA de MICROSERVICIOS'
CONTENERIZADO con KUBERNETES manejado. 


El ORDEN de MODULOS que se debe manejar para el DESPLIEGUE (SCRIPTs) respectivo CORRECTO debe ser el siguiente:

1. boot-admin-server
2. employee-service
3. department-service
4. organization-service


INSTALACION / DESINSTALACION:
----------------------------
Para la INSTACION/DESINSTALACION en WINDOWS se debe ejecutar los siquientes SCRIPTs. 

- CREATE_Objects_Kubernetes.bat 
- DELETE_Objects_Kubernetes.bat
  
IMPORTANTE: Es bueno saber que luego de ELIMINAR el ambiente completo con los SCRIPTs, se debera ACTUALIZAR lo que son los IPs en el archivo HOST (si las IPs NO son estaticas),
as� como la IP definida en objeto 'ENDPOINT' del archivo: '1_stack_[Logstash-Endpoits-Service].yml'


HERRAMIENTAS (MICROSERVICIOS):
-----------------------------
 0. MICROMETER: Herramienta que sirve de FACHADA SIMPLE como medio para integrar & enviar METRICAS del ACTUATOR (Monitoreo Externo). 
 1. ZIPKIN:     Herramienta que permite obtener mediantes AGENTES la TRAZABILIDAD de las ejecuciones en los MICROSERVICIOS.
 2. JAEGER:     Herramienta similar ZIPKIN.  
 3. PROMETHEUS: Herramienta de MONITORIZACI�N que brinda una INTERFACE (B�SICA) en base a las m�tricas de los MICROSERVICIOS de forma peri�dica, 
                enviados con el ACTUATOR por el MICROMETER. 
 4. GRAFANA:    Herramienta de MONITORIZACI�N para MULTRIPLES DATASOURCES (Prometheus, BDs, ElasticSearch, Graphite, Kiali etc), que permite visualizar & 
                generar DASHBOARs as� como enviar ALERTAS & REGLAS.  
 5. KIALI:      Herramienta que proporciona m�tricas detalladas, una integraci�n b�sica de GRAFANA, est� disponible para consultas avanzadas. 
                El rastreo distribuido se proporciona integrando JAEGER


 