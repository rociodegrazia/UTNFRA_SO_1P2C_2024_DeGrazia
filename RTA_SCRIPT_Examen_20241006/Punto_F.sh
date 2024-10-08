#!/bin/bash

#Se guarda el archivo filtro_avanzado.txt en la ruta que corresponde

SALIDA_ARCHIVO="$HOME/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Filtro_Avanzado.txt"


#OBTENEMOS IP PUBLICA 

IP_PUBLICA=$(curl -s ifconfig.me)

#OBTENEMOS NOMBRE DE USER

USUARIO=$(whoami)

#HASH DE USUARIO

HASH_USUARIO=$(echo $USUARIO | sha256sum | awk '{print $1}')

#CAMBIO AL DIRECTORIO REMOTO PARA EVITAR ERRORES CON GIT 

cd /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia

#OBTIENE URL DEL REPO DE GIT

REPO_URL=$(git remote get-url origin)

#OBTENEMOS INFO EN EL ARCHIVO Filtro_Avanzado.txt

echo "Mi IP publica es: $IP_PUBLICA" > $SALIDA_ARCHIVO
echo "Mi Usuario es: $USUARIO" >> $SALIDA_ARCHIVO
echo "El Hash de mi Usuario es: $HASH_USUARIO" >> $SALIDA_ARCHIVO
echo "La URL de mi repositorio es: $REPO_URL" >> $SALIDA_ARCHIVO
