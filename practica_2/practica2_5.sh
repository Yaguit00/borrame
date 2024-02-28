#!/bin/bash
#878417, Torres Garcia, Yago, T, 3, A
#870959, Pueyo Soria, Nicolas, T, 3, A

OldIFS=$IFS
IFS='\n'
echo -n 'Introduzca el nombre de un directorio: '; read var

#caso si existe: cuantos artchivos y cuantos directorios hoy en ese directorio, sin aplicar recursividad

if [ -d "$var" ] && [ "$(find "$var" -maxdepth 1 -type d)" ];
then
    tmp=$(find "$var" -maxdepth 1 -type d | wc -l)
    tmp=$(( $tmp - 1 ))
    echo "El numero de ficheros y directorios en $var es de $(find $var -maxdepth 1 -type f | wc -l) y $tmp, respectivamente"
#caso no existe: Escribe "ruta leida no es un directorio"

else
    echo "$var no es un directorio"
fi
IFS=$OldIFS
