# Analisis-Forense
Proyecto para automatización de análisis forense básico en Windows según la guía de Incibe <br>
https://www.certsi.es/sites/default/files/contenidos/guias/doc/incibe_toma_evidencias_analisis_forense.pdf

Ha sido probado con éxito en un Windows 10 **MIRAR EL UPDATE MÁS ABAJO**

El ejecutable es Forense.bat <br>
<b>IMPORTANTE EJECUTARLO COMO ADMINISTRADOR PARA QUE ALGUNOS COMANDOS TENGAN PRIVILEGIOS SUFICIENTES</b>

Hay una variable "disco" al inicio, que debe ser reemplazada con la letra del disco que corresponda al pendrive o disco duro en el que se lleve el kit.<br>
Falta la carpeta WiresharkPortable con todo su contenido (por problemas de tamaño al querer subirlo a Github). Podéis descargar el instalador de la versión portable de la página oficial de Wireshark e instalarlo en el directorio donde tengáis el resto de carpetas de este repositorio.
El enlace para descarga directa de la versión empleada es https://1.eu.dl.wireshark.org/win32/WiresharkPortable_2.4.5.paf.exe

Falta también la carpeta de FTK Imager (por la misma razón que la de Wireshark Portable). El enlace de la versión empleada es https://accessdata.com/product-download/ftk-imager-version-4.2.0 y al descargarlo y tener la carpeta, cambiad el nombre de "FTK Imager" a "FTKImager" (Quitando el espacio vamos)

**UPDATE 08/03/2018**<br>
Se ha realizado la primera prueba en Windows 10<br>
Se ha añadido un "pause" entre cada acción para poder llevar un mayor control de las acciones.<br>
Se ha añadido una variable "disco" al principio, que debe ser reemplazada con la letra del disco que corresponda al pendrive o disco duro en el que se lleve el kit.<br>
Esta variable disco sirve para redirigir la salida de los comandos, que al ejecutarse como administrador por defecto iba a Windows\System32.<br>

**PARA HACER**<br>
Añadir hostname a raw de memoria para copiarlo tras volcarlo<br>
RegFileExport.exe falla<br>
Exportar clave de registro de Windows Active Center falla<br>
Exportar clave de registro de  Programas alguna vez ejecutados en la maquina falla<br>
Exportar clave de registro de Ultimas apps utilizadas falla<br>
Revisar el volcado de portapapeles<br>
ntfswalk sin licencia
