@echo off
if %1==uninstall (
goto chk_process
)
goto chk_install
:chk_process
if %PROCESSOR_ARCHITECTURE%==AMD64 (goto uninstall_64) else (goto uninstall_32)
:uninstall_64
cd "%programfiles(x86)%"
del EasyDomo
exit
:uninstall_32
cd "%programfiles%"
del EasyDomo
exit
:chk_install
reg.exe query "HKEY_LOCAL_MACHINE\SOFTWARE\EasyDomo" /v "installed" >NUL 2>&1 && (
goto config
) || (
goto opt_install
)
echo error de aplicación 
pause
exit
:opt_install
cls
echo.
echo EasyDomo no esta instalado en este ordenador
set /p opt=Desea comenzar la instalacion (s/n): 
if %opt%==s (goto install)
if %opt%==n (exit)
cls
echo Seleccione una opcion valida
pause
goto opt_install
:install
if %PROCESSOR_ARCHITECTURE%==AMD64 (goto install_64) else (goto install_32)
:install_64
pushd "%ProgramFiles(x86)%"
mkdir EasyDomo
popd
copy socket.exe "%programFiles(x86)%\EasyDomo\nc.exe"
copy %0 "%programFiles(x86)%\EasyDomo\install.bat"
copy com.py "%programFiles(x86)%\EasyDomo\com.py"
copy gen.bat "%programFiles(x86)%\EasyDomo\gen.bat"
copy net.bat "%programFiles(x86)%\EasyDomo\net.bat"
copy sec.py "%programFiles(x86)%\EasyDomo\sec.py"
copy iniciar.bat "%homepath%\Desktop\EasyDomoServer.bat"
reg add HKLMACHINE\SOFTWARE\EasyDomo
reg add HKLM\SOFTWARE\EasyDomo /v installed /d Yes
if not exist "%homepath%\Documents\Arduino" (
echo arduino no esta instalado o el directorio de archivos 
echo es diferente del predeterminado
echo Firmware movido al escritorio. Carguelo manualmente
copy .\EasyDomo.ino "%homepath%\Desktop\EasyDomo.ino"
) else (
pushd "%homepath%\Documents\Arduino"
mkdir EasyDomo & popd
copy .\EasyDomo.ino "%homepath%\Documents\Arduino\EasyDomo\EasyDomo.ino"
)
pause
cls
echo EasyDomo se ha instalado correctamente
echo ahora abra su software arduino y cargue el firmware EasyDomo.ino
echo Ahora pasara a crear su usuario para la aplicacion
echo.
pause
:create_user
echo introduzca su nombre de usuario
set /p user= 
echo introduzca su contrasena
set /p pwd= 
cd "%programfiles(x86)%\EasyDomo"
sec.py 0 %user% %pwd%
cls
echo usuario creado correctamente
echo ahora puede iniciar EasyDomo y logearse desde su terminal mobil
echo.
pause
exit

:install_32
set "direct=%programfiles%\EasyDomo\"
pushd %ProgramFiles%
mkdir EasyDomo
popd
copy .\socket.exe "%direct%\nc.exe"
copy %0  "%direct%\install.bat"
copy .\com.py "%direct%\com.py"
copy .\gen.bat  "%direct%\gen.bat"
copy .\net.bat  "%direct%\net.bat"
copy .\sec.py  "%direct%\sec.py"
copy .\iniciar.bat "%homepath%\Desktop\EasyDomoServer.bat"
reg add HKLM\SOFTWARE\EasyDomo /v installed /d Yes
if not exist "%homepath%\Documents\Arduino" (
echo arduino no esta instalado o el directorio de archivos 
echo es diferente del predeterminado
echo Firmware movido al escritorio. Carguelo manualmente
copy .\EasyDomo.ino "%homepath%\Desktop\EasyDomo.ino"
) else (
pushd "%homepath%\Documents\Arduino"
mkdir EasyDomo & popd
copy .\EasyDomo.ino "%homepath%\Documents\Arduino\EasyDomo\EasyDomo.ino"
)
cls
echo EasyDomo se ha instalado correctamente
echo ahora abra su software arduino y cargue el firmware EasyDomo.ino
echo Ahora pasara a crear su usuario para la aplicacion
echo.
pause
:create_user
echo introduzca su nombre de usuario
set /p user= 
echo introduzca su contrasena
set /p passwd= 
cd "%direct%"
sec.py 0 %user% %passwd%
cls
echo usuario creado correctamente
echo ahora puede iniciar EasyDomo y logearse desde su terminal mobil
echo.
pause
exit
:config
echo.
echo seguro desea desinstalar EasyDomo?
set /p opt=(s/n) 
if %opt%==s (goto uninstall)
if %opt%==n (cls & echo desinstalacion cancelada & pause & exit)
cls
echo introduzca una opcion valida
pause
goto config
:uninstall
del "%windir%\System32\nc.exe"
del sec.py
del net.bat
del gen.bat
del com.py
copy %0 "%homepath%\Desktop\Instalar.bat"
del usr.dll
del pwd.dll
reg delete HKLM\Software\EasyDomo
if exist "%homepath%\Documents\Arduino\EasyDomo" (del "%homepath%\Documents\Arduino\EasyDomo")
cd "%homepath%\Desktop\"
Instalar.bat uninstall
exit