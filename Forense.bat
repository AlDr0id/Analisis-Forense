@echo OFF
echo -------------------------------------- Ejecutar como administrador ------------------------------------------

echo -------------------------------------------------------------------------------------------------------------
echo -------------------------------------------------------------------------------------------------------------
echo ------------------------------------------- INICIO DE LA EJECUCION ------------------------------------------
echo -------------------------------------------------------------------------------------------------------------
echo -------------------------------------------------------------------------------------------------------------


echo ---------------------- Ejecutar como administrador ------------------------

@echo OFF

echo ############################### INICIO DE RECOLECCION DE DATOS VOLATILES ###############################

echo Obtencion de fecha y hora inicial
date /t > FechaYHoraInicio.txt &time /t >> FechaYHoraInicio.txt

echo Obtencion de memoria en raw
Comae-Toolkit-3.0.20180207.1\x64\DumpIt.exe


echo Obtencion del hash del archivo raw
MultiHasher_2.8.2_win\MultiHasher.exe


echo Obtencion del listado de procesos en ejecucion
tasklist > "ProcesosEnEjecucion-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Obtencion del listado de servicios en ejecucion
sc query > "ServiciosEnEjecucion-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Obtencion de los usuarios actualmente con sesion iniciada
logonSessions\logonsessions64.exe > "IniciosDeSesion-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Obtencion del estado de la red
ipconfig /all > "EstadoRed-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Obtencion de los los accesos por netbios
nbtstat -S > "ConexionesNetBios-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Obtencion de archivos copiados por netbios
net file > "ArchivosCopiadosNetbios-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Obtencion de conexiones activas
netstat -an | findstr /i "estado listening established" > "ConexionesActivas-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Obtencion de apps y puertos
netstat -nabo > "AppsYPuertos-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Obtencion de Cache DNS
ipconfig /displaydns > "CacheDNS-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Obtencion de tabla ARP
arp -a > "TablaARP-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Obtencion del trafico de la red
WiresharkPortable\WiresharkPortable.exe


echo Obtencion de las claves de registro
reg export HKEY_CLASSES_ROOT "HKCR-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export HKEY_CURRENT_USER "HKCU-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export HKEY_LOCAL_MACHINE "HKLM-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export HKEY_USERS "HKU-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export HKEY_CURRENT_CONFIG "HKCC-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"


echo Obtencion de archivos del registro
regfileexport\RegFileExport.exe "NTUSER.DAT" "NTUserDat-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
regfileexport\RegFileExport.exe "SAM" "Sam-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
regfileexport\RegFileExport.exe "SECURITY" "Security-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
regfileexport\RegFileExport.exe "SOFTWARE" "Software-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
regfileexport\RegFileExport.exe "SYSTEM" "System-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"


echo Obtencion de los dispositivos USB que se han conectado a la maquina
reg export "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum\USBSTOR" "USBSTOR-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum\USB" "USB-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\DeviceClasses" "DeviceClasses-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_LOCAL_MACHINE\System\MountedDevices" "MountedDevices-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"


echo Obtencion del fichero setupapi.dev.log
copy C:\Windows\INF\setupapi.dev.log "SetupApi-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.log"


echo Obtencion del listado de redes WiFi a las que se ha conectado la maquina
netsh wlan show profiles > "PerfilesWiFi-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"
netsh wlan show all > "ConfiguracionPerfilesWiFi-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Obtencion de la configuracion de Windows Action Center
reg export "HKEY_LOCAL_MACHINE\Software\Microsoft\Security Center" "HKLM-SecurityCenter-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center" "HKLM-ActionCenter-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"


echo Obtencion de la configuracion del firewall
reg export "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy" "HKLM-FirewallPolicy-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"


echo Obtencion de las entradas de registro con los programas que se inician al iniciar el SO
reg export "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" "HKCU-ShellFolders-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" "HKCU-UserShellFolders-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" "HKCU-Run-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce" "HKCU-RunOnce-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows" "HKCU-Windows-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" "HKLM-ShellFolders-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" "HKLM-UserShellFolders-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" "HKLM-Explorer-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run" "HKLM-Run-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce" "HKLM-RunOnce-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager" "HKLM-SessionManager-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"


echo Obtencion de las asociaciones entre extensiones y programas
for %%t in (batfile cmdfile comfile exefile htafile https JSEfile piffile regfile scrfile txtfile VBSfile WSFFile) do (
reg export "HKEY_CLASSES_ROOT\%%t\shell\open\command" "HKCR-%%t-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
)
for %%t in (batfile comfile exefile piffile) do (
reg export "HKEY_LOCAL_MACHINE\software\Classes\%%t\shell\open\command" "HKLM-%%t-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
)


echo Obtencion de los programas ejecutados alguna vez en la maquina
reg export "HKEY_CURRENT_USER\Software\Classes\Local Setings\Software\Microsoft\Windows\Shell\MuiCache" "MuiCache-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"


echo Obtencion de las ultimas aplicaciones utilizadas
reg export "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU" "UltimasAppsUtilizadas-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"


echo Obtencion de los ultimos documentos abiertos
reg export "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" "DocumentosRecientes-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"


echo Obtencion del software instalado
reg export "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall" "SoftwareInstalado-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"


echo Obtencion de contraseñas del navegador
webbrowserpassview\WebBrowserPassView.exe /stab "ContraseñasNavegadores-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Obtencion de contraseñas de los recursos de red
netpass\netpass.exe /stab "ContraseñasRed-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Obtencion de contraseñas de los gestores de correo
mailpv\mailpv.exe /stab "ContraseñasCorreo-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Obtencion del listado de directorios y ficheros (Del disco duro C. Si hay mas, añadirlos aparte)
dir /t:w /a /s /o:d c:\ > "ListadoFicherosFechaModificacion-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"
dir /t:a /a /s /o:d c:\ > "ListadoFicherosUltimoAcceso-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"
dir /t:c /a /s /o:d c:\ > "ListadoFicherosFechaCreacion-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Obtencion del historico de comandos ejecutados en una terminal abierta
doskey /history > "HistoricoCMD-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Obtencion del portapapeles
insideclipboard\InsideClipboard.exe /saveclp "Portapapeles-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Obtencion del historial de los navegadores
browsinghistoryview\BrowsingHistoryView.exe


echo Obtencion de las ultimas busquedas
mylastsearch\MyLastSearch.exe /stab "UltimasBusquedas-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Identificacion de volumenes cifrados
edd\EDD.exe > "VolumenesCifrados-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Obtencion de unidades mapeadas
net use > "UnidadesMapeadas-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Obtencion de carpetas compartidas
net share > "CarpetasCompartidas-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo ################################## FIN DE RECOLECCION DE DATOS VOLATILES ##################################

echo $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
echo $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
echo $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

echo ############################### INICIO DE RECOLECCION DE DATOS NO VOLATILES ###############################


echo Obtencion de imagen del disco
Forense\FTKImager\FTKImager.exe


echo Obtencion del MBR
MBRutil\MBRutil.exe /S="MBR-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.dat"


echo Obtencion del MFT (De C, si hay mas discos añadirlos aparte)
ntfswalk64.v.0.72.win\ntfswalk64.exe -partition c -csv "MFT-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.csv"


echo Obtencion de informacion del sistema
systeminfo > "InfoDelSistema-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Obtencion de las tareas programadas
schtasks > "TareasProgramadas-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Obtencion del PATH
path > "PATH-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Obtencion de logs del sistema
wevtutil epl application "ApplicationLog-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"
wevtutil epl system "SystemLog-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"
wevtutil epl security "SecurityLog-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Obtencion del log de actualizaciones
copy C:\Windows\WindowsUpdate.log "WindowsUpdate-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.log"


echo Obtencion de los archivos de la papelera (En el explorador de archivos no apareceran, pero si desde cmd)
mkdir Papelera
xcopy C:\$Recycle.Bin\* Papelera /e /i /h


echo Obtencion del fichero Hosts
type C:\Windows\System32\drivers\etc\hosts > "FicheroHosts-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"


echo Obtencion de fecha y hora final
date /t > FechaYHoraFin.txt &time /t >> FechaYHoraFin.txt


echo ################################# FIN DE RECOLECCION DE DATOS NO VOLATILES #################################
echo -------------------------------------------------------------------------------------------------------------
echo -------------------------------------------------------------------------------------------------------------
echo -------------------------------------------- FIN DE LA EJECUCION --------------------------------------------
echo -------------------------------------------------------------------------------------------------------------
echo -------------------------------------------------------------------------------------------------------------
