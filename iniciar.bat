@echo off
if %PROCESSOR_ARCHITECTURE%==AMD64 (goto net_64) else (goto net_32)
:net_64
cd "%programfiles(x86)%\EasyDomo"
if not exist BUILDMAP.txt (
echo No existe el archivo de instalacion
echo el asistente de creacion de archivos de instalacion se abrira ahora
echo reninicie el servidor tras generar el archivo de instalacion
call gen.bat
)
net.bat
:net_32
cd "%programfiles%\EasyDomo"
if not exist BUILDMAP.txt (
echo No existe el archivo de instalacion
echo el asistente de creacion de archivos de instalacion se abrira ahora
echo reninicie el servidor tras generar el archivo de instalacion
call gen.bat
)
net.bat