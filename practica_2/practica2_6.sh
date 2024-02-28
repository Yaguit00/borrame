#!/bin/bash
#878417, Torres Garcia, Yago, T, 3, A
#870959, Pueyo Soria, Nicolas, T, 3, A

numDirectorio=$(ls -p "$HOME" | grep "bin[ a-zA-Z0-9 ][ a-zA-Z0-9 ][ a-zA-Z0-9 ]/" | wc -l)
if [ $numDir -ne 0 ]
then
tmp=0
for dir in $(ls -p "$HOME" | grep "bin[ a-zA-Z0-9 ][ a-zA-Z0-9 ][ a-zA-Z0-9 ]/") 
do
if [ "$(stat -c %Y $HOME/$dir)" -gt $tiempo ]
then
barraBin="$HOME/$dir"
bin=$(echo "$barraBin" | cut -c 1-$((${#barraBin}-1))) #quito la barra sabiendo la lingitud -1
fi
done
else
bin=$(mktemp -d "$HOME/binXXX")
echo "Se ha creado el directorio $bin"
fi
#copiar todos los archivos del directorio actual al binXXX
cont=0
echo "Directorio destino de copia: $bin"
for elem in *
do
if [ -x "$elem" -a ! -d "$elem" ]
then
cp "$elem" "$bin"
echo "./$elem ha sido copiado a $bin"
cont=$((cont+1))
fi
done
if [ $cont -ne 0 ]
then
echo "Se han copiado $cont archivos"
else
echo "No se ha copiado ningun archivo"
