#!/bin/bash

#Llamamos a todo lo necesario

source funciones
printf "limite %d cifras %d limite %d \n" $limite $cifras $temp
#Ponemos el contador a cero
contador=0

#menu
clear

echo "Escoja una de las siguientes opciones:"
echo "1.-Jugar a Anzan tradicional"
echo "2.-Jugar a Flash Anzan"
echo "3.-Configurar"
echo ""
echo "(escriba el número de la opción deseada)"

read op

case $op in 

    1)
	function mostrar (){
	    printf "%0"$ceros"d \t \n" $sumando
	}
	function solucion (){

	    echo "---------"
	}

	;;
    2)
	function mostrar (){
	    clear
	    sleep 0.1
	    echo ""
	    echo ""
	    echo ""
	    echo ""
	    echo ""
	    echo ""
	    echo ""
	    echo "                                $sumando"

	    sleep $temp
	}

	function solucion (){   
	    clear
	    echo "Respuesta:"
	}
	;;

    3)
	echo "¿Cuántos sumandos quiere que muestre anzan?"
	read limite
	echo "¿Cuántas cifras quiere que tenga cada sumando?"
	read ceros
	case $ceros in
	    1)
		cifras=9
		;;

	    2)
		cifras=99
		;;

	    3)
		cifras=999
		;;

	    4)
		cifras=9999
		;;

	    5)
		cifras=99999
		;;

	    6)
		temp=999999
		;;

	    *)
		printf "No vas a poder con eso, te pongo algo más asequible..."
		cifras=999999
		;;
	esac
	echo "¿Cuánto tiempo quiere que le muestre cada sumando? (este parámetro sólo es válido en flash anzan)" 
	echo "*0.5 es medio segundo. Recuerde usar el punto y no la coma*"
	read temp
	echo "¿Cuántos segundos necesita para calcular el total?"
	echo "*0.5 es medio segundo. Recuerde usar el punto y no la coma*"
	read solutemp
	#y ahora lo mandamos todo al archivo de configuración.
	echo "#!/bin/bash">confi
	echo "limite=$limite">>confi
	echo "ceros=$ceros">>confi
	echo "cifras=$cifras">>confi
	echo "temp=$temp">>confi
	echo "solutemp=$solutemp">>confi
	bash inicio.sh
	;;

    *)
	echo "usted ha seleccionado una opción que no existe"
	sleep 1
	bash inicio.sh
	;;
esac 

#lanzamos la función anzan.
anzansuma
