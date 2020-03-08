
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
----------------------------------------------------------------------------------------------------------------------------------------------------------------- 
----------------------------------------------------------------------------------------------------------------------------------------------------------------- 

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
 
 
----------------------------------------------------------------------------------------------------------------------------------------------------------------- 
----------------------------------------------------------------------------------------------------------------------------------------------------------------- 
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
 

----------------------------------------------------------------------------------------------------------------------------------------------------------------- 
----------------------------------------------------------------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------  

PROMETHEUS: Estadisticos (métricas) manejadas por 'ACTUATOR & MICROMETER'.
----------  
 Metricas relacionadas con los 'COMPONENTES INTERNOS' de:
  
 *. JVM (uso de memoria, recolección de basura, subprocesos, etc.). 
 *. Tomcat (sesiones, solicitud / respuesta HTTP, errores, etc.). 
 *. Grupo de conexión de base de datos, Logback, proceso (hora de inicio, uso de CPU) & sistema (CPU). 
 *. Carga del sistema, uso de CPU, etc. 

  - http_client_requests_seconds_count          =>  Obtiene la CANTIDAD de REQUEST por cada funcionalidad (URI) ejecutada (*). 
  - logback_events_total                        =>  Obtiene el TOTAL de EVENTOS ejecutados por cada NIVEL de logs (*).
  - jdbc_connections_max	                    =>  Obtiene el número máximo de conexiones jdbc registradas por un DataSource (*). 
  - hikaricp_connections_max	                =>  Obtiene el numero maximo de conexiones (*).   
  - hikaricp_connections	                    =>  Obtiene el número máximo de conexiones hikaricp disponibles (*).
  - jvm_buffer_memory_used_bytes	            =>  Obtiene la CANTIDAD de MEMORIA utilizada a la fecha, por cada uno de los MicroServicios (*).
  - http_server_requests_seconds_sum	        =>  Obtiene el la SUMA de segundos tomados en una solicitud http específica (*). 
  - process_cpu_usage	                        =>  Obtiene el "uso reciente de la CPU" para el proceso de JVM por MicroServicios (*).     
  - system_cpu_usage	                        =>  Obtiene el "uso reciente de la CPU" para todo el sistema por MicroServicios (*).        
  - tomcat_global_error_total	                =>  El número de errores generados en los REQUEST hacia el servidor (*).       
  - tomcat_threads_config_max_threads	        =>  El número máximo de HILOS disponibles para REQUEST (*). 
                                                                                                                                               
  - hikaricp_connections_acquire_seconds_count	=>  Tiempo que tomó adquirir la conexión.                                                                                                                                  
  - hikaricp_connections_acquire_seconds_max	=>  Tiempo que tomó adquirir la conexión.                                                                                                                                      
  - hikaricp_connections_acquire_seconds_sum	=>  Tiempo que tomó adquirir la conexión.                                                                                                                                      
  - hikaricp_connections_active	                =>  Número total de conexiones activas de hikaricp.                                                                                                                                            
  - hikaricp_connections_creation_seconds_count	=>  Conteo total de tiempo que tomó crear una conexión.                                                                                                                    
  - hikaricp_connections_creation_seconds_max	=>  Tiempo máximo que tomó crear una conexión.                                                                                                                                   
  - hikaricp_connections_creation_seconds_sum   =>  Tiempo total que tomó crear todas las conexiones.                                                                                                                        
  - hikaricp_connections_idle	                =>  Número de conexiones inactivas.                                                                           
  - hikaricp_connections_min	                =>  Cantidad mínima de conexiones.                                                                                                                                                               
  - hikaricp_connections_pending	            =>  Número de hilos actualmente en estado pendiente.                                                                                                                                       
  - hikaricp_connections_timeout_total	        =>  Tiempo de espera total de todas las conexiones.                                                                                                                                  
  - hikaricp_connections_usage_seconds_count	=>  Tiempo de uso de la conexión.                                                                                                                                              
  - hikaricp_connections_usage_seconds_max	    =>  Máximo tiempo de uso de la conexión.                                                                                                                                           
  - hikaricp_connections_usage_seconds_sum	    =>  Suma total del tiempo de uso de la conexión.                                                                                                                               
  - http_server_requests_seconds_count	        =>  Muestra el recuento de una solicitud http específica junto con el resto de los datos de esa solicitud.                                                                         
  - http_server_requests_seconds_max	        =>  Muestra la duración máxima de las solicitudes http junto con el resto de los datos de la solicitud.      
  - jdbc_connections_active	                    =>  Número total de conexiones jdbc activas registradas.                                              
  - jdbc_connections_min	                    =>  Número mínimo de conexiones jdbc registradas.                                                                                                                                                    
  - job_data_size_memory	                    =>  Uso de memoria para trabajo específico.                                                                                                                                                          
  - job_data_size_results	                    =>  Cuántos registros se recuperaron por trabajo específico.                                                                                                                                         
  - job_timer_seconds_count	                    =>  Tiempo que llevó ejecutar el trabajo en segundos.                                                                                                                                         
  - job_timer_seconds_max	                    =>  Tiempo máximo que se tardó en ejecutar el trabajo en segundos.                                                                                                                                 
  - job_timer_seconds_sum	                    =>  Tiempo total que llevó ejecutar el trabajo en segundos.                                                                                                                                      
  - jobs_size	                                =>  ¿Cuántos JOBs se ejecutaron?.                                                                                                                                                                          
  - jobs_taskstatus_size	                    =>  Contiene información sobre trabajos que se ejecutaron.                                                                                                                                           
  - jvm_buffer_count_buffers	                =>  Una estimación del número de buffers en la agrupación.   
  - jvm_buffer_total_capacity_bytes	            =>  Una estimación de la capacidad total de los buffers en este grupo.                                                                                                                     
  - jvm_classes_loaded_classes	                =>  El número de clases que se cargan actualmente en la máquina virtual Java.                                                                                                                  
  - jvm_classes_unloaded_classes_total	        =>  El número total de clases descargadas desde que la máquina virtual Java comenzó a ejecutarse.                                                                                   
  - jvm_gc_live_data_size_bytes	                =>  Tamaño del grupo de memoria de la generación anterior después de un GC completo.                                                                                                         
  - jvm_gc_max_data_size_bytes	                =>  Tamaño máximo del grupo de memoria de la generación anterior.                                                                                                                                
  - jvm_gc_memory_allocated_bytes_total	        =>  Incrementado para un aumento en el tamaño del grupo de memoria de generación joven después de un GC hasta antes del siguiente.                                                       
  - jvm_gc_memory_promoted_bytes_total	        =>  Recuento de aumentos positivos en el tamaño del grupo de memoria de la generación anterior antes de GC a después de GC.                                                              
  - jvm_gc_pause_seconds_count	                =>  Número de veces que pasó en pausa GC.                                                                                                                                                        
  - jvm_gc_pause_seconds_max	                =>  Tiempo máximo empleado en pausa de GC en segundos.                                                                                                                                               
  - jvm_gc_pause_seconds_sum	                =>  Tiempo total empleado en pausa de GC en segundos.                                                                                                                                              
  - jvm_memory_committed_bytes	                =>  La cantidad de memoria en bytes que se compromete para que la máquina virtual Java la use.                                                                                                     
  - jvm_memory_max_bytes	                    =>  La cantidad máxima de memoria en bytes que se puede usar para la administración de memoria.                                                                                                        
  - jvm_memory_used_bytes	                    =>  La cantidad de memoria utilizada.                                                                                                                                                                    
  - jvm_threads_daemon_threads	                =>  El número actual de hilos de daemon en vivo.                                                                                                                                                   
  - jvm_threads_live_threads	                =>  El número actual de subprocesos en vivo, incluidos subprocesos daemon y no daemon.                                                                                                               
  - jvm_threads_peak_threads	                =>  El número máximo de subprocesos en vivo desde que se inició la máquina virtual Java o se restableció el pico.                                                                                    
  - jvm_threads_states_threads	                =>  El número actual de hilos que tienen estado NUEVO.                                                
  - pageaccess_total	                        =>  Número de páginas visitadas por página.                                         
  - process_files_max_files	                    =>  El recuento máximo de descriptores de archivo.                                                                                                                                                     
  - process_files_open_files	                =>  El recuento de descriptor de archivo abierto.                                                                                                                                                  
  - process_start_time_seconds	                =>  Hora de inicio del proceso desde unix epoch.                                                                                                                                                 
  - process_uptime_seconds	                    =>  El tiempo de actividad de la máquina virtual Java.                                                                                                                                               
  - sessions_active	                            =>  Número e información de sesiones activas.                                                                                                                                                               
  - sessions_login_total	                    =>  Número e información de inicios de sesión y usuarios.                                                                                                                                              
  - system_cpu_count	                        =>  El número de procesadores disponibles para la máquina virtual Java.                                
  - tomcat_global_received_bytes_total	        =>  Número total de bytes recibidos de solicitudes.                                                                                                                   
  - tomcat_global_request_max_seconds	        =>  Tiempo máximo que llevó ejecutar una solicitud específica.                                                                                                            
  - tomcat_global_request_seconds_count	        =>  El número de solicitudes en todos los conectores.                                                                                                                
  - tomcat_global_request_seconds_sum	        =>  Tiempo total que tomó ejecutar solicitudes.                                                                                                                         
  - tomcat_global_sent_bytes_total	            =>  Número total de bytes enviados desde solicitudes.                                                                                                                     
  - tomcat_threads_busy_threads	                =>  Número actual de hilos ocupados.  
  - tomcat_threads_current_threads	            =>  Número actual de hilos usados por solicitudes.    
  
  
QUERYS: ejemplos diferentes: 
------
 
  1. Obtener la CANTIDAD de REQUEST por cada funcionalidad (URI) ejecutada: 
     http_client_requests_seconds_count 
  
  2. Obtener la CANTIDAD de REQUEST de tipo GET que terminaron OK, para el URI: '/utlcapadb/get/organizaciones':  
     http_client_requests_seconds_count{ method="GET", status="200", uri="/utlcapadb/get/organizaciones" }
  
  3. Obtener la CANTIDAD de REQUEST de tipo GET para el URIs: '/utlcapadb/get/empleados', 'utlcapadb/get/departamentos', '/utlcapadb/get/organizaciones':  
     http_client_requests_seconds_count{ method="GET", uri=~"/utlcapadb/get/empleados|/utlcapadb/get/departamentos|/utlcapadb/get/organizaciones" }
     
  4. Obtener la CANTIDAD de REQUEST de tipo GET para TODOS los MicroServicios, pero que NO sean de tipo: GET: 
     http_client_requests_seconds_count{ job=~".*",method!="GET" }
 
  5. Obtener la CANTIDAD de REQUEST de tipo GET para TODOS el MicroServicio: '[employee-service]', hace 5 minutos:  
     http_client_requests_seconds_count{ job="Prometheus-Server -> [employee-service]"} offset 5m

  6. Obtener la SUMATORIA de la: MEMORIA MAXIMA - MEMORIA USADA, en MB por cada MicroServicio: 
     sum by( job )(jvm_memory_max_bytes - jvm_memory_used_bytes) / 1024 / 1024
     
  7. Obtener la TOTAL de la: MEMORIA MAXIMA - MEMORIA USADA, en MB por cada MicroServicio: 
     count by( job )(jvm_memory_max_bytes - jvm_memory_used_bytes) / 1024 / 1024
  
  8. Obtener el PROMEDIO de la CANTIDAD de REQUEST, por MicroServicio: 
     avg( http_client_requests_seconds_count ) by( job )
 
 
 
----------------------------------------------------------------------------------------------------------------------------------------------------------------- 
----------------------------------------------------------------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------  

GRAFANA: Configuraciones de VISUALIZACIÓN  de Estadisticos (métricas) enviadas desde un DATASOURCE ('PROMETHEUS').
--------  
  
 1. [EXPLORE]: 
    Para realizar QUERYS sobre las métricas.
    
    - avg( http_client_requests_seconds_count ) by( job ) 
    - http_client_requests_seconds_count{ job=~".*",method!="GET" }
   
 2. [CORREO]: 
    Configuración de SMTP desde .yml para SOBREESCRIBIR con 'ConfigMaps'. 
    
    * Configurar en GMAIL el 'ACCESO A APLICACIONES POCO SEGURAS': https://myaccount.google.com/u/0/lesssecureapps?pli=1
    * Desde el POD ingresar (VALIDAR): 
      - cat /etc/grafana/grafana.ini 
    
 3. [DATASOURCE]:
    Existen diferentes para en este caso se manejara una conexion con: 'PROMETHEUS'.  
    
    - CONEXION_PROMETHEUS
    - http://capacitacion.microservicios.prometheus-server
    - GET
    
 4. [USUARIOS]:
    Creación de USERs, es requerido el envio & confirmacion del CORREO. 
    
    - cesarricardo_guerra19@hotmail.com
    - CESAR GUERRA
    - admin 
    
 5. [GRUPOS]:
    Creación de TEAMs & asignacion de USERs.  
    
    - ADMINISTRADORES
    - cesarricardo_guerra19@hotmail.com
    
 6. [FOLDERS]: 
    Creación de DIRECTORIO para agrupacion de 'DASHBOARDs'. 
    
    - CAPACION_MICROSERVICIOS       

 7. [DASHBOARD]: 
    Creación de DIAGRAMAS de diferente tipo:
    
    - Seleccionar 'ADD-QUERY'.
    - Nombrear en GENERAL: 'DASHBOARD #1'
    - Elegir la 'CONEXION_PROMETHEUS'.
    - Ingresar el QUERT.
    - Grabar & Asignar al 'FOLDER'. 
    
    'DASHBOARD #1': 
    - http_client_requests_seconds_count{ method=~"$PARAM_002" }
    
    'DASHBOARD #2':
    - http_client_requests_seconds_count{ job=~".*",method!="GET" }
     
    'DASHBOARD #3':
    - avg( http_client_requests_seconds_count ) by( job ) 
    
    'DASHBOARD #4 [UNIDO]': Los 3 en 1. 
    - http_client_requests_seconds_count{ method=~"$PARAM_001" }
    - http_client_requests_seconds_count{ job=~".*",method!="GET" }
    - avg( http_client_requests_seconds_count ) by( job ) 
    
 8. [VARIABLES/PARAMETROS]:
    Creación de VARIABLES de diferentes tipos, para su reutilización (es por 'DASHBOARD'): 
     
   - PARAM_001,  TEXTBOX           [Variable de tipo TEXTBOX]
   - PARAM_002,  CONSTANT => GET   [Variable de tipo CONSTANT]
   - PARAM_003,  INTERVAL => 1,2,3,4,5,6,7,8,9   [Variable de tipo SELECT]
   - PARAM_004,  QUERY    => label_values(http_client_requests_seconds_count, status) , 'CONEXION_PROMETHEUS', 'ALPHABETICAL', 'MULTI-VALUE'  [Variable de tipo QUERY]
      
 9. [PLAYLIST]:
    Creación de PRESENTACIONES automaticas de cada 'DASHBOARD'.
    
    - PLAYLIST_CAPACITACION
    - 1m
    - StartPaylist => In-Kiosk-Mode  
      
 10. [COMPARTIR]: 
     Permite EXPONER para su visusalizacion los DASHBOARDs trabajados. 
     
     * 'SNAPSHOT (LOCAL)': 
       - Expire: 1 Day
       - URL (se debe cambiar por el DNS): http://localhost:3000/dashboard/snapshot/3ooNCoA4H7p2KJBQN6bwGm5B0Kb4ExbF 
     
     * 'SNAPSHOT (PUBLIC)': 
       - Expire: 1 Day
       - URL: https://snapshot.raintank.io/dashboard/snapshot/3DJHD8Q7GDdOYMuaR6lrbG6DomoFY7yk
 
 11. [ALERTAS]: 
     Creación de ALERTAS ante alguna REGLA existente. Se pueden realizar para conectar con: SMTP, SLACK, etc.
     
     * Configurar 'Notification Channels':
       - EnviarCorreo_Grafana
       - Email  
       - Default (Send on All Allers)
       - Include Image
       - Ingresar EMAIL.
       
     * Agregar DASHBOARD ('GRAPH'):
       - sum( logback_events_total )
       
     * Agregar la ALERTA & asociar al DASHBOARD (sobre acepta el de: 'GRAPH'):
       - ALERTA ERROR  1m  5m
       - WHEN max() OF query(A,5m,now) IS ABOVE 'ingresar #'
       - Alerting
       - Alerting  
       - Asociar al 'Notification Channels' => 'EnviarCorreo_Grafana'
       - SUBJECT: Buen día, este es un EMAIL de ALERTA generado de la Plataforma GRAFANA debido a que ha habido un FALLA en contra de la REGLA definida. Esto a causa de que se ha sobre pasado el máximo de: [5110].
                  Por favor revisar la causa. Gracias.
              
 12. ['EXPORT / IMPORT' de DASHBOARDs (PLUGINs)]:      
     Permite EXPORT los DASHBOARD trabajados para ser luego reutilizados ó IMPORT otros existentes en EXTERNAMENTE. 
     
     - 'EXPORT': Es por 'DASHBOARD' ir 'MENU SUPERIOR/Export'. 
     - 'IMPORT': Se debe de buscar los PLUGINs para MICROMETER & ACTUATOR en: 'https://grafana.com/grafana/dashboards'
 
 
----------------------------------------------------------------------------------------------------------------------------------------------------------------- 
----------------------------------------------------------------------------------------------------------------------------------------------------------------- 
----------------------------------------------------------------------------------------------------------------------------------------------------------------- 

KIBANA:  
------
 
DEPURADOR DE 'GROK':
-------------------
Esta es una HERRAMIENTA para DEPURAR el PATRÓN que se ingresará en 'LOGSTASH':
- https://grokdebug.herokuapp.com/
  
  
El FORMATO a aplicar es: %{PATTERN:nombre} ,basado en una lista de PATRONES brindados, que referencian: 'EXPRESIONES REGULARES'.
 
EJEMPLO #1:
 - Esto: \[ significa NO considera el caracter: [ , en el PATTERN diseñado de salida. 
 
EJEMPLO #2:
 [2020-01-28 22:14:38.219] [INFO] [logging.pattern.console] | -----> HOLA ESTE ES UN MENSAJE DE PRUEBA
 
 - PATRON DISEÑADO: \[%{TIMESTAMP_ISO8601:fecha}\] \[%{LOGLEVEL:nivel}\] \[%{JAVACLASS:clase}\] \| %{GREEDYDATA:mensaje}   
 
 - SALIDA:  
 {
   "fecha": "2020-01-28 22:14:38.219",
   "mensaje": "-----> HOLA ESTE ES UN MENSAJE DE PRUEBA",
   "nivel": "INFO",
   "clase": "logging.pattern.console"
 }
 
 
OPCIONES DEL MENÚ:
----------------- 
  
* [DISCOVER]:
  - Utilizado para busquedas en LOGs:
  - Se tiene 2 opciones de LENGUAJES: 'LUCENE' & 'KQL' (Kibana Queue Language).
  - Los QUERYs son en base a la TRAMA depurada que viene de 'LOGSTASH'.
  
    A. 'LUCENE': Más restricción en la QUERY: 
       - CESAR GUERRA        => SI FUNCIONA
       - CeSaR GuErRa        => SI FUNCIONA
       - NOT CESAR GUERRA    => NO FUNCIONA 
       - NoT CeSar GuErRa    => NO FUNCIONA
       
    B. 'KQL': Más opciones en la QUERY: 
       - CESAR GUERRA        => SI FUNCIONA
       - CeSaR GuErRa        => SI FUNCIONA
       - NOT CESAR GUERRA    => SI FUNCIONA 
       - NoT CeSaR GuErRa    => SI FUNCIONA
       
       EJEMPLOS: 
       - 200 AND RGUERRA                  => Obtiene LOGs en donde encuentre el valor de '200' & 'RGUERRA'. 
       - 200 OR URL                       => Obtiene LOGs en donde encuentre el valor de '200' o 'URL'. 
       - nivel:WARN OR nivel:INFO         => Obtiene LOGs 'EXCLUSIVAMENTE' ubicados en la COLUMNA: 'nivel', los valores: 'WARN' o 'INFO'.   
       - NOT nivel:INFO                   => Obtiene LOGs 'DIFERENTES' al tipo INFO de la columna: 'nivel'.
       - NOT nivel:INFO AND mensaje:*URL* => Obtiene LOGs 'DIFERENTES' al tipo INFO de la columna: 'nivel' & a la palabra 'URL' en la columna:'mensaje'.
       - NOT nivel:INFO AND (fecha:"2020-01-*" OR fecha:"2020-02-*") => Obtiene LOGs 'DIFERENTES' al tipo INFO de la columna: 'nivel' & a las 'fechas' en dicho rando.  
       - NOT nivel:INFO AND (fecha:("2020-01-*" OR "2020-02-*"))     => Obtiene LOGs 'DIFERENTES' al tipo INFO de la columna: 'nivel' & a las 'fechas' en dicho rando [REDUCIDO].  
       - NOT nivel:INFO AND (fecha:"2020-01-*" TO fecha:"2020-02-*") => Obtiene LOGs 'DIFERENTES' al tipo INFO de la columna: 'nivel' & a las 'fechas' en dicho rando [MEJORADO].  
       
  - Se debe 'SAVE' para guardar el QUERY utilizado (se grabará el contenido tal cual de la TABLA)
  - Para obtenerlo dar 'OPEN' para abrir el QUERY.
  - Para ver la libreria registrada ir a: 'MENU IZQ/MANAGEMENT/SAVED OBJECTs'.
  
    - Guardar 'DISCOVER_01_[QUERY]' =>  NOT nivel:INFO AND (fecha:("2020-01-*" OR "2020-02-*"))
    - Guardar 'DISCOVER_02_[QUERY]' =>  nivel:INFO OR nivel:ERROR OR nivel:WARN
   
  
* [VISUALIZE]: 
  - Utilizado para búsquedas de datos 'VISUALMENTE' (diseño). 
 
  1- VISUALIZE_01_[HISTOGRAMA]  
	 - 'Y-AXIS':  
       - AGREGATION: Count 
	 - 'X-AXIS': 
	   - AGREGATION: 'Date Histogram'
	   - @timestamp
        
  2- VISUALIZE_02_[PIE]
     - AGREGATION: Count
     - AGREGATION: Filters 
       - nivel:INFO    NIVEL [INFO]
       - nivel:ERROR   NIVEL [ERROR]
       - nivel:WARN    NIVEL [WARN ]
       
  3- VISUALIZE_04_[TABLE]
     - AGREGATION: Count
     - LABEL: CANTIDAD
     BUCKET: 
     - AGREGATION: Filters  
       - nivel:INFO
       - nivel:ERROR
       - nivel:WARN
       
  4- VISUALIZE_05_[METRIC]
     - AGREGATION: Count
     - LABEL: LOGs
     BUCKET: 
     - AGREGATION: Filters 
       - nivel:*       TOTAL 
       - nivel:INFO    NIVEL [INFO]
       - nivel:ERROR   NIVEL [ERROR]
       - nivel:WARN    NIVEL [WARN]
  
  5- VISUALIZE_03_[GOAL] 
     - AGREGATION: Count
     - LABEL: LOGS DE MICROSERVICIOS
     BUCKET: 
     - AGREGATION: Filters
       - objeto:"*utl-capadb*" OR objeto:"*employee-service*" OR objeto:"*department-service*" OR objeto:"*organization-service*"
     - RANGO:
       - 0       ==> 1000000
       - 1000000 ==> 2000000
       - 2000000 ==> 3000000
 
  6- VISUALIZE_06_[PIE]
     - AGREGATION: Count
     - AGREGATION: Filters 
       - nivel:ERROR AND objeto:"*utl-capadb*"            ERROR [utl-capadb]
       - nivel:ERROR AND objeto:"*employee-service*"      ERROR [employee-service]
       - nivel:ERROR AND objeto:"*department-service*"    ERROR [department-service]
       - nivel:ERROR AND objeto:"*organization-service*"  ERROR [organization-service]
   
  7- VISUALIZE_07_[TABLE]
     - AGREGATION: Count
     - LABEL: CANTIDAD
     BUCKET: 
     - AGREGATION: Filters  
       - nivel:ERROR AND objeto:"*utl-capadb*"            ERROR [utl-capadb]
       - nivel:ERROR AND objeto:"*employee-service*"      ERROR [employee-service]
       - nivel:ERROR AND objeto:"*department-service*"    ERROR [department-service]
       - nivel:ERROR AND objeto:"*organization-service*"  ERROR [organization-service]
     - PERCENTAGE COLUMN:  CANTIDAD
       
  8- VISUALIZE_08_[MARKDOWN]
     - IMPORTANTE: los LINKs deben ser de cada 'DASHBOARD' & son desde el '#' hasta ANTES del simbolo '?'
     
	 **DASHBOARDs**
	 ==========
	
	 Seleccionar: 
	 ------------ 
	
	 * [**DashBoard #1:**](#/dashboard/59e1d940-6013-11ea-a484-a5d5aee2706f).
	 * [**DashBoard #2:**](#/dashboard/aa5716d0-60b6-11ea-9536-7183173faa23).

      
 
* [DASHBOARD]: 
  - Utilizado para la REUTILIZACIÓN diseños de 'VISUALIZE' & 'QUERYS', guardados previamente como OBJETOS. 
  - Contenido de 'DASHBOARDS': 
  
  A- DASHBOARD_01_[GRUPO]: muestra el detalle de los 'NIVELES DE LOGS' de los MICROSERVICIOS. 
    - VISUALIZE_08_[MARKDOWN]
    - VISUALIZE_01_[HISTOGRAMA]
    - VISUALIZE_02_[PIE]
    - VISUALIZE_04_[TABLE]
    - VISUALIZE_05_[METRIC]
    - VISUALIZE_03_[GOAL] 
    - DISCOVER_02_[QUERY]
  
  B- DASHBOARD_02_[GRUPO]: muestra el detalle de FALLAS por cada MICROSERVICIO. 
    - VISUALIZE_08_[MARKDOWN]
    - VISUALIZE_01_[HISTOGRAMA]
    - VISUALIZE_06_[PIE]
    - VISUALIZE_07_[TABLE]
 
 
* [EXPORT / IMPORT]: 
  - Utilizado para EXPORTAR o IMPORTAR los objetos trabajados. 
  - Ir: 'MENU IZQ/MANAGEMENT/SAVED OBJECTs'. 
    - EXPORT => 'TallerMicroservicios_KIBANA_[EXPORT].ndjson'
    - IMPORT => 'TallerMicroservicios_KIBANA_[EXPORT].ndjson' 
  
  