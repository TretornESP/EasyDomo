@echo off
setlocal enabledelayexpansion
title Asistente para creacion de instalacion nueva EasyDomo
:main
:name
cls
echo.
echo Nombre de la instalacion?
set /p name= 
if exist %name%.bat (
cls
echo La instalacion ya existe elija otro o borre la anterior
pause
goto main
)
:gen_basics
echo %name%.bat > buildmap.txt
echo @echo off > %name%.bat
echo :chk_pwd >> %name%.bat
echo cls >> %name%.bat
echo set /p usr=Usuario:  >> %name%.bat
echo set /p pswd=Contrasena:  >> %name%.bat
echo sec.py 1 %%usr%% %%pswd%% >> %name%.bat
echo if %%errorlevel%%==1 (goto def) >> %name%.bat
echo echo contrasena o usuario incorrectos >> %name%.bat
echo ping -n 4 localhost ^> nul >> %name%.bat
echo goto chk_pwd >> %name%.bat
:rooms
cls
echo.
echo numero de habitaciones con dispositivos a controlar 
echo Nota: un numero superior a 4 suele ocasionar problemas
echo de espacio con los displays de los mobiles
echo.
set /p rooms= (max 9 habitaciones) 
if %rooms% GTR 9 (cls & echo numero de habitaciones no valido & pause & goto rooms)
:generate_rooms
echo :graph >> %name%.bat
echo cls >> %name%.bat
echo echo Bienvenido %%usr%% >> %name%.bat
for /L %%a in (1,1,%rooms%) do (
echo echo --------------------  >> %name%.bat
echo echo -                  -  >> %name%.bat
echo echo - NOMBRE: %%room%%a%% >> %name%.bat
echo echo -    ID: %%a          >> %name%.bat
echo echo -                   - >> %name%.bat
echo echo --------------------  >> %name%.bat
)
echo echo teclee exit para salir >> %name%.bat
echo echo Seleccione la habitacion a controlar >> %name%.bat
echo set /p opt= >> %name%.bat
echo if %%opt%%==exit (exit) >> %name%.bat
for /L %%a in (1,1,%rooms%) do (
call :write_if %%a
)
for /L %%a in (1,1,%rooms%) do (
call :write_control %%a
)
echo :def >> %name%.bat
for /L %%a in (1,1,%rooms%) do (
call :set_roomname %%a
)
echo goto graph >> %name%.bat
echo :decode >> %name%.bat
echo if %%state%%==1 (goto decode_upper) >> %name%.bat
echo if %%state%%==0 (goto decode_lower)   >> %name%.bat
echo :decode_upper >> %name%.bat
echo set send_data=%%send_data:1=A%% >> %name%.bat
echo set send_data=%%send_data:2=B%% >> %name%.bat
echo set send_data=%%send_data:3=C%% >> %name%.bat
echo set send_data=%%send_data:4=D%% >> %name%.bat
echo set send_data=%%send_data:5=E%% >> %name%.bat
echo set send_data=%%send_data:6=F%% >> %name%.bat
echo set send_data=%%send_data:7=G%% >> %name%.bat
echo set send_data=%%send_data:8=H%% >> %name%.bat
echo set send_data=%%send_data:9=I%% >> %name%.bat
echo set send_data=%%send_data:10=J%% >> %name%.bat
echo goto send >> %name%.bat
echo :decode_lower >> %name%.bat
echo set send_data=%%send_data:1=a%% >> %name%.bat
echo set send_data=%%send_data:2=b%% >> %name%.bat
echo set send_data=%%send_data:3=c%% >> %name%.bat
echo set send_data=%%send_data:4=d%% >> %name%.bat
echo set send_data=%%send_data:5=e%% >> %name%.bat
echo set send_data=%%send_data:6=f%% >> %name%.bat
echo set send_data=%%send_data:7=g%% >> %name%.bat
echo set send_data=%%send_data:8=h%% >> %name%.bat
echo set send_data=%%send_data:9=i%% >> %name%.bat
echo set send_data=%%send_data:10=j%% >> %name%.bat
echo goto send >> %name%.bat
echo :send >> %name%.bat
echo com.py %%send_data%% >> %name%.bat
echo goto graph >> %name%.bat
goto finalizar
:set_roomname
set /p roomname= Nombre de habitacion %1 
echo set room%1=%roomname% >> %name%.bat
goto :EOF

:write_if
echo if %%opt%%==%1 (goto control_%1) >> %name%.bat
goto :EOF

:write_control
echo :control_%1 >> %name%.bat
echo cls >> %name%.bat
echo echo. >> %name%.bat
echo echo seleccione funcion >> %name%.bat
echo echo 1: Encender luces >> %name%.bat
echo echo 2: Apagar luces >> %name%.bat
echo set /p opt=  >> %name%.bat
echo if %%opt%%==1 (set send_data=%1 ^& set state=1 ^& goto decode) >> %name%.bat
echo if %%opt%%==2 (set send_data=%1 ^& set state=0 ^& goto decode) >> %name%.bat
echo echo Introduzca un numero valido >> %name%.bat
echo goto graph >> %name%.bat
goto :EOF

:finalizar
cls
echo El asistente ha terminado de generar su instalacion del hogar
pause
exit