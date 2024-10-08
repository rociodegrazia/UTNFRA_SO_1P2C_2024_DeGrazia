#!/bin/bash

#Se guarda el archivo filtro_basico.txt en la ruta que corresponde 

SALIDA_ARCHIVO="$HOME/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Filtro_Basico.txt"

#Total de memoria RAM (linea de memoria total desde /proc/meminfo)

MEMORIA_TOTAL_RAM=$(grep MemTotal /proc/meminfo | awk '{print $2 " " $3}')

#Fabricante del chasis 

CHASIS_FABRICANTE=$(sudo dmidecode -t chassis | grep "Manufacturer" | awk -F ': ' '{print $2}')

#Escritura de resultados anterior en el archivo Filtro_Basico.TXT

echo "MemTotal: $MEMORIA_TOTAL_RAM" > "$SALIDA_ARCHIVO" # Crea el archivo y escribe el total de memoria
echo -e "\nChassis Information: $CHASIS_FABRICANTE" >> "$SALIDA_ARCHIVO" # Añade la información del fabricante
