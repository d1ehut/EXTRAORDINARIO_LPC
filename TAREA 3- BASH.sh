#!/bin/bash
#
#Probando si la ip esta activa
function ip() {
	ping -c 1 $1 > /dev/null 2>$1
	[ $? -eq 0 ] && echo "Host con IP: $i esta activa."
}
#
#Escaneando puertos abiertos
function dos() {
	for ((counter =$firstport; counter<=$lastport; counter++))
	do
		(echo >/dev/tcp/host/counter) > /dev/null 2>1 && echo "$counter open"
	done
}
#
#Ciclo de escaneo de ip´s
function uno() {
	for i in 192.168.100.{1..255}
	do
		ip $i
	done
}
#
#Desplegar informacion del Host
function tres() {
	echo "Nombre de usuario:"
	whoami
	echo ""
	echo "Nombre del host:"
	hostname
	echo ""
	echo "Tipo de SO:"
	cat /etc/*-release
}
#Menu
fecha= date +"%A %d %B"
echo ""
echo "	1.Escanear equipos activos en la red
	2.Escanear puertos abiertos en un equipo
	3.Desplegar -Host -Usuario -SO
	4.Exit"
	
read opc

case $opc in
	1)
	uno
	;;
	2)
	echo "Ingrese el puerto inicial:"
	read firstport
	echo "Ingrese el puerto final:"
	read lastport
	dos
	;;
	3)
	tres
	;;
	4)
	exit
	;;
esac
