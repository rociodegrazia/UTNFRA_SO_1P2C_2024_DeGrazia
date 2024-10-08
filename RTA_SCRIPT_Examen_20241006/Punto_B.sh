#!/bin/bash
DISK="/dev/sdc"
fdisk $DISK <<EOF
n
p
1

+1G
#se creo la 1ra particion
n
p
2

+1G
#se creo la 2da partición
n
p
3

+1G
#se creo la 3ra partición
n
e
#se crea la partición extendida de 7 GB
+7G

# Ahora comenzamos a crear las particiones lógicas dentro de la extendida
n
l

+1G
n
l

+1G
n
l

+1G
n
l

+1G
n
l

+1G
n
l

+1G
n
l

+1G
# última partición lógica

w
EOF

# Formateamos las particiones
# Formatear las particiones usando la variable $DISK
sudo mkfs -t ext4 "${DISK}1"  # Partición primaria 1
sudo mkfs -t ext4 "${DISK}2"  # Partición primaria 2
sudo mkfs -t ext4 "${DISK}3"  # Partición primaria 3
sudo mkfs -t ext4 "${DISK}5"  # Partición lógica 1
sudo mkfs -t ext4 "${DISK}6"  # Partición lógica 2
sudo mkfs -t ext4 "${DISK}7"  # Partición lógica 3
sudo mkfs -t ext4 "${DISK}8"  # Partición lógica 4
sudo mkfs -t ext4 "${DISK}9"  # Partición lógica 5
sudo mkfs -t ext4 "${DISK}10" # Partición lógica 6
sudo mkfs -t ext4 "${DISK}11" # Partición lógica 7

# Montar de manera persistente, crear las carpetas fuera del directorio
sudo mount /dev/sdc1 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_1/parcial_1
sudo mount /dev/sdc2 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_1/parcial_2
sudo mount /dev/sdc3 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_1/parcial_3
sudo mount /dev/sdc5 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_2/parcial_1
sudo mount /dev/sdc6 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_2/parcial_2
sudo mount /dev/sdc7 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_2/parcial_3
sudo mount /dev/sdc8 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_3/parcial_1
sudo mount /dev/sdc9 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_3/parcial_2
sudo mount /dev/sdc10 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_3/parcial_3
sudo mount /dev/sdc11 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/profesores

# Agregar entradas al archivo fstab para montar automáticamente al inicio
echo "/dev/sdc1 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_1/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc2 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_1/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc3 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_1/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc5 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_2/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc6 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_2/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc7 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_2/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc8 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_3/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc9 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_3/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc10 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_3/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc11 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/profesores ext4 defaults 0 0" | sudo tee -a /etc/fstab
# Montar todas las entradas en fstab
sudo mount -a
