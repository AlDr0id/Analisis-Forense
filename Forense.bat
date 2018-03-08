
SET disco=E:\



@echo OFF

echo -------------------------------------- Ejecutar como administrador ------------------------------------------

echo -------------------------------------------------------------------------------------------------------------
echo -------------------------------------------------------------------------------------------------------------
echo ------------------------------------------- INICIO DE LA EJECUCION ------------------------------------------
echo -------------------------------------------------------------------------------------------------------------
echo -------------------------------------------------------------------------------------------------------------


echo ---------------------- Ejecutar como administrador ------------------------

echo ############################### INICIO DE RECOLECCION DE DATOS VOLATILES ###############################

echo Obtencion de fecha y hora inicial
date /t > %disco%FechaYHoraInicio.txt &time /t >> %disco%FechaYHoraInicio.txt

pause

echo Obtencion de memoria en raw
%disco%Comae-Toolkit-3.0.20180207.1\x64\DumpIt.exe

pause

echo Obtencion del hash del archivo raw
%disco%MultiHasher_2.8.2_win\MultiHasher.exe

pause

echo Obtencion del listado de procesos en ejecucion
tasklist > "%disco%ProcesosEnEjecucion-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Obtencion del listado de servicios en ejecucion
sc query > "%disco%ServiciosEnEjecucion-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Obtencion de los usuarios actualmente con sesion iniciada
%disco%logonSessions\logonsessions64.exe > "%disco%IniciosDeSesion-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Obtencion del estado de la red
ipconfig /all > "%disco%EstadoRed-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Obtencion de los los accesos por netbios
nbtstat -S > "%disco%ConexionesNetBios-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Obtencion de archivos copiados por netbios
net file > "%disco%ArchivosCopiadosNetbios-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Obtencion de conexiones activas
netstat -an | findstr /i "estado listening established" > "%disco%ConexionesActivas-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Obtencion de apps y puertos
netstat -nabo > "%disco%AppsYPuertos-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Obtencion de Cache DNS
ipconfig /displaydns > "%disco%CacheDNS-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Obtencion de tabla ARP
arp -a > "%disco%TablaARP-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Obtencion del trafico de la red
%disco%WiresharkPortable\WiresharkPortable.exe

pause

echo Obtencion de las claves de registro
reg export HKEY_CLASSES_ROOT "%disco%HKCR-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export HKEY_CURRENT_USER "%disco%HKCU-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export HKEY_LOCAL_MACHINE "%disco%HKLM-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export HKEY_USERS "%disco%HKU-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export HKEY_CURRENT_CONFIG "%disco%HKCC-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"

pause

echo Obtencion de archivos del registro
%disco%regfileexport\RegFileExport.exe "NTUSER.DAT" "%disco%NTUserDat-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
%disco%regfileexport\RegFileExport.exe "SAM" "%disco%Sam-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
%disco%regfileexport\RegFileExport.exe "SECURITY" "%disco%Security-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
%disco%regfileexport\RegFileExport.exe "SOFTWARE" "%disco%Software-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
%disco%regfileexport\RegFileExport.exe "SYSTEM" "%disco%System-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"

pause

echo Obtencion de los dispositivos USB que se han conectado a la maquina
reg export "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum\USBSTOR" "%disco%USBSTOR-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum\USB" "%disco%USB-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\DeviceClasses" "%disco%DeviceClasses-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_LOCAL_MACHINE\System\MountedDevices" "%disco%MountedDevices-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"

pause

echo Obtencion del fichero setupapi.dev.log
copy C:\Windows\INF\setupapi.dev.log "%disco%SetupApi-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.log"

pause

echo Obtencion del listado de redes WiFi a las que se ha conectado la maquina
netsh wlan show profiles > "%disco%PerfilesWiFi-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"
netsh wlan show all > "%disco%ConfiguracionPerfilesWiFi-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Obtencion de la configuracion de Windows Action Center
reg export "HKEY_LOCAL_MACHINE\Software\Microsoft\Security Center" "%disco%HKLM-SecurityCenter-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center" "%disco%HKLM-ActionCenter-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"

pause

echo Obtencion de la configuracion del firewall
reg export "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy" "%disco%HKLM-FirewallPolicy-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"

pause

echo Obtencion de las entradas de registro con los programas que se inician al iniciar el SO
reg export "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" "%disco%HKCU-ShellFolders-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" "%disco%HKCU-UserShellFolders-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" "%disco%HKCU-Run-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce" "%disco%HKCU-RunOnce-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows" "%disco%HKCU-Windows-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" "%disco%HKLM-ShellFolders-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" "%disco%HKLM-UserShellFolders-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" "%disco%HKLM-Explorer-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run" "%disco%HKLM-Run-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce" "%disco%HKLM-RunOnce-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
reg export "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager" "%disco%HKLM-SessionManager-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"

pause

echo Obtencion de las asociaciones entre extensiones y programas
for %%t in (batfile cmdfile comfile exefile htafile https JSEfile piffile regfile scrfile txtfile VBSfile WSFFile) do (
reg export "HKEY_CLASSES_ROOT\%%t\shell\open\command" "%disco%HKCR-%%t-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
)
for %%t in (batfile comfile exefile piffile) do (
reg export "HKEY_LOCAL_MACHINE\software\Classes\%%t\shell\open\command" "%disco%HKLM-%%t-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"
)

pause

echo Obtencion de los programas ejecutados alguna vez en la maquina
reg export "HKEY_CURRENT_USER\Software\Classes\Local Setings\Software\Microsoft\Windows\Shell\MuiCache" "%disco%MuiCache-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"

pause

echo Obtencion de las ultimas aplicaciones utilizadas
reg export "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU" "%disco%UltimasAppsUtilizadas-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"

pause

echo Obtencion de los ultimos documentos abiertos
reg export "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" "%disco%DocumentosRecientes-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"

pause

echo Obtencion del software instalado
reg export "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall" "%disco%SoftwareInstalado-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.reg"

pause

echo Obtencion de contraseñas del navegador
%disco%webbrowserpassview\WebBrowserPassView.exe /stab "%disco%ContraseñasNavegadores-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Obtencion de contraseñas de los recursos de red
%disco%netpass\netpass.exe /stab "%disco%ContraseñasRed-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Obtencion de contraseñas de los gestores de correo
%disco%mailpv\mailpv.exe /stab "%disco%ContraseñasCorreo-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Obtencion del listado de directorios y ficheros (Del disco duro C. Si hay mas, añadirlos aparte)
dir /t:w /a /s /o:d c:\ > "%disco%ListadoFicherosFechaModificacion-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"
dir /t:a /a /s /o:d c:\ > "%disco%ListadoFicherosUltimoAcceso-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"
dir /t:c /a /s /o:d c:\ > "%disco%ListadoFicherosFechaCreacion-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Obtencion del historico de comandos ejecutados en una terminal abierta
doskey /history > "%disco%HistoricoCMD-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Obtencion del portapapeles
%disco%insideclipboard\InsideClipboard.exe /saveclp "%disco%Portapapeles-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Obtencion del historial de los navegadores
%disco%browsinghistoryview\BrowsingHistoryView.exe

pause

echo Obtencion de las ultimas busquedas
%disco%mylastsearch\MyLastSearch.exe /stab "%disco%UltimasBusquedas-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Identificacion de volumenes cifrados
%disco%edd\EDD.exe > "%disco%VolumenesCifrados-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Obtencion de unidades mapeadas
net use > "%disco%UnidadesMapeadas-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Obtencion de carpetas compartidas
net share > "%disco%CarpetasCompartidas-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo ################################## FIN DE RECOLECCION DE DATOS VOLATILES ##################################

echo $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
echo $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
echo $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

echo ############################### INICIO DE RECOLECCION DE DATOS NO VOLATILES ###############################

pause

echo Obtencion de imagen del disco
%disco%FTKImager\FTKImager.exe

pause

echo Obtencion del MBR
%disco%MBRutil\MBRutil.exe /S="%disco%MBR-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.dat"

pause

echo Obtencion del MFT (De C, si hay mas discos añadirlos aparte)
%disco%ntfswalk64.v.0.72.win\ntfswalk64.exe -partition c -csv "%disco%MFT-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.csv"

pause

echo Obtencion de informacion del sistema
systeminfo > "%disco%InfoDelSistema-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Obtencion de las tareas programadas
schtasks > "%disco%TareasProgramadas-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Obtencion del PATH
path > "%disco%PATH-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Obtencion de logs del sistema
wevtutil epl application "%disco%ApplicationLog-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"
wevtutil epl system "%disco%SystemLog-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"
wevtutil epl security "%disco%SecurityLog-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Obtencion del log de actualizaciones
copy C:\Windows\WindowsUpdate.log "%disco%WindowsUpdate-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.log"

pause

echo Obtencion de los archivos de la papelera (En el explorador de archivos no apareceran, pero si desde cmd)
mkdir %disco%Papelera
xcopy C:\$Recycle.Bin\* %disco%Papelera /e /i /h

pause

echo Obtencion del fichero Hosts
type C:\Windows\System32\drivers\etc\hosts > "%disco%FicheroHosts-%date:~6,4%%date:~3,2%%date:~0,2%-%time:~0,2%%time:~3,2%.txt"

pause

echo Obtencion de fecha y hora final
date /t > %disco%FechaYHoraFin.txt &time /t >> %disco%FechaYHoraFin.txt

pause

echo ################################# FIN DE RECOLECCION DE DATOS NO VOLATILES #################################
echo -------------------------------------------------------------------------------------------------------------
echo -------------------------------------------------------------------------------------------------------------
echo -------------------------------------------- FIN DE LA EJECUCION --------------------------------------------
echo -------------------------------------------------------------------------------------------------------------
echo -------------------------------------------------------------------------------------------------------------
