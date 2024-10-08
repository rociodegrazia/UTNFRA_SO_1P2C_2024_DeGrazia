#!/bin/bash

#Grupos alumnos y profesores
sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores

#Crear los usuarios con grupos secundarios y contraseñas

#Alumno 1 (contraseña simple)
sudo useradd -m -G p1c2_2024_gAlumno -s /bin/bash p1c2_2024_A1
echo "p1c2_2024_A1:p1c2_2024_A1" | sudo chpasswd

#Alumno 2 (contrseña simple)
sudo useradd -m -G p1c2_2024_gAlumno -s /bin/bash p1c2_2024_A2
echo "p1c2_2024_A2:p1c2_2024_A2" | sudo chpasswd

#Alumno 3 con contraseña hash

HASHED_PASSWORD_A3=$(openssl passwd -6 p1c2_2024_A3)
sudo useradd -m -G p1c2_2024_gAlumno -s /bin/bash p1c2_2024_A3
echo "p1c2_2024_A3:$HASHED_PASSWORD_A3" | sudo chpasswd -e

# Profesor 1 (P1) con contraseña hash
HASHED_PASSWORD_P1=$(openssl passwd -6 p1c2_2024_P1)
sudo useradd -m -G p1c2_2024_gProfesores -s /bin/bash p1c2_2024_P1
echo "p1c2_2024_P1:$HASHED_PASSWORD_P1" | sudo chpasswd -e

# Asignar permisos a directorios

#Alumno 1 -RWX R-X --- 750
sudo chown p1c2_2024_A1:p1c2_2024_gAlumno ~/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_1
sudo chmod 750 ~/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_1

#Alumno 2 -RWX RW- --- 760
sudo chown p1c2_2024_A2:p1c2_2024_gAlumno ~/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_2
sudo chmod 760 ~/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_2

#Alumno 3 -RWX --- ---700
sudo chown p1c2_2024_A3:p1c2_2024_gAlumno ~/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_3
sudo chmod 700 ~/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_3


# PROFESOR -rwx rwx r-x 775
sudo chown p1c2_2024_P1:p1c2_2024_gProfesores ~/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/profesores
sudo chmod 775 ~/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_1


# Crear el archivo validar.txt en cada carpeta con el resultado de whoami
echo "Creando validar.txt en cada carpeta..."

# Alumno 1
sudo -u p1c2_2024_A1 bash -c 'echo $(whoami) > /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_1/validar.txt'

# Alumno 2
sudo -u p1c2_2024_A2 bash -c 'echo $(whoami) > /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_2/validar.txt'

# Alumno 3
sudo -u p1c2_2024_A3 bash -c 'echo $(whoami) > /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/alumno_3/validar.txt'

# Profesor 1
sudo -u p1c2_2024_P1 bash -c 'echo $(whoami) > /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_DeGrazia/RTA_ARCHIVOS_Examen_20241006/Examenes_UTN/profesores/validar.txt'

echo "Archivos validar.txt creados en las respectivas carpetas."
