Bienvenido a EasyDomo

EasyDomo es un sistema de domótica libre compatible con placas arduino
para mas información: DameBandaKL@gmail.com

Para la instalación (arduino):
	
	Conecte los relés que activen su instalación eléctrica a los pines
	digitales 2,3,4,5,6,7,8,9,10 y 11

	Conecte la tierra a el pin GND digital de su placa arduino

Para la instalación (EasyDomo):
	
	Abra el archivo start.bat en situado en su escritorio y siga los pasos
	que se le indiquen
	
	Abra su software de control y desarrollo de arduino y cargue el firmware
	EasyDomo.ino

	Ahora abra el archivo EasyDomoServer.bat situado por defecto en su escritorio
	(por motivos de seguridad el programa tendrá que permanecer abierto para que
	pueda conectarse)

Para conectarse:
	
	EasyDomo utiliza netcat para conectarse desde un servidor remoto
	por lo tanto netcat tendrá que estar instalado en su dispositivo mobil
	(disponible en android e ios (jailbreak requerido))
	
	Una vez instalado entre en la terminal de su dispositivo con privilegios
	de administrador y ejecute el siguiente comando (nc SUIP 600)
	
	donde, SUIP tendrá que ser sustituido por la IP (preferiblemente local) de
	el ordenador en el que esté corriendo el servidor
	(ej. nc 192.168.1.34 600)
	
	Una vez conectado introduzca el usuario y la contraseña que puso al configurar
	la instalación de EasyDomo y comience a controlar su hogar de forma remota!
